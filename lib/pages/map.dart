import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class MyMapScreen extends StatefulWidget {
  @override
  _MyMapScreenState createState() => _MyMapScreenState();
}

class _MyMapScreenState extends State<MyMapScreen> {
  GoogleMapController? mapController;
  List<Marker> markers = [];
  TextEditingController locationController = TextEditingController();

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void addMarker(String location) async {
    List<Location> locations = await locationFromAddress(location);
    if (locations.isNotEmpty) {
      LatLng position = LatLng(locations[0].latitude!, locations[0].longitude!);
      setState(() {
        markers.add(
          Marker(
            markerId: MarkerId(position.toString()),
            position: position,
          ),
        );
      });
      mapController?.animateCamera(CameraUpdate.newLatLng(position));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Peta dengan Mark dan Inputan Wilayah'),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: TextFormField(
              controller: locationController,
              decoration: InputDecoration(
                labelText: 'Wilayah',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                GoogleMap(
                  onMapCreated: onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(-8.1721, 113.7007), // Ubah sesuai koordinat Jember
                    zoom: 15.0,
                  ),
                  markers: Set<Marker>.from(markers),
                ),
                Positioned(
                  bottom: 16.0,
                  left: 16.0,
                  child: FloatingActionButton(
                    onPressed: () {
                      addMarker(locationController.text);
                    },
                    child: Icon(Icons.add),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
