import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tugas_api/pages/login.dart';
import 'package:tugas_api/pages/map.dart';
import 'package:tugas_api/pages/papuma.dart';
import 'package:tugas_api/pages/profile.dart';
import 'package:tugas_api/pages/sukorambi.dart';
import 'package:tugas_api/pages/teluk_love.dart';
import 'package:tugas_api/pages/watu_ulo.dart';
import 'package:tugas_api/services/google_auth.dart';

class HomePage extends StatefulWidget {
  final UserCredential userCredential;
  const HomePage({super.key, required this.userCredential});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  GoogleMapController? mapController;
  
  @override
  void initState() {
    super.initState();
  }

  Future<List<QueryDocumentSnapshot>> fetchData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('gambar').get();
    return querySnapshot.docs;
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      ListView(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                ),
                height: kToolbarHeight + MediaQuery.of(context).padding.top + 100.0,
                decoration: BoxDecoration(
                  color: Color(0xff19A7CE), // Warna latar belakang Container
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50.0),
                    bottomRight: Radius.circular(50.0),
                  )
                ), 
                
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Padding(padding: 
                      EdgeInsets.only(top: 10.0),
                      child: Image.asset(
                      'images/Splash_screen.png',
                      width: 100.0,
                      height: 100.0,
                    ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(padding: 
                            EdgeInsets.only(left: 20),
                            child: Text(
                            widget.userCredential.user?.displayName ?? "Null",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ),
                          
                          SizedBox(width: 70.0,),
                          InkWell(
                            onTap: () {
                GoogleAuth.signInWithGoogle().then((value) {
                  if (value.user != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Profile(
                          userCredential: value,
                        ),
                      ),
                    );
                  }
                });
              },
              
              child: FutureBuilder<List<QueryDocumentSnapshot>>(
                future: fetchData(),
                builder: (BuildContext context, AsyncSnapshot<List<QueryDocumentSnapshot>> snapshot) {
                  if (snapshot.hasData) {
                    List<QueryDocumentSnapshot> data = snapshot.data!;
                    List<Widget> imageWidgets = data.map((document) {
                      Map<String, dynamic> documentData = document.data() as Map<String, dynamic>;
                      return documentData['images'] == ""
                          ? Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.black, // Warna garis tepi
                                  width: 2.0, // Lebar garis tepi
                                ),
                                color: Colors.white, // Warna latar belakang putih
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50.0), // Ukuran border circular
                                child: Image.asset(
                                  'images/profile.png',
                                  width: 60.0,
                                  height: 60.0,
                                ),
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Color(0xff146C94), // Warna garis tepi
                                  width: 5.0, // Lebar garis tepi
                                ),
                                color: Colors.white, // Warna latar belakang putih
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100.0), // Ukuran border circular
                                child: Image.network(
                                  documentData['images'],
                                  width: 60,
                                  height: 60,
                                ),
                              ),
                            );
                    }).toList();
                    return Wrap(
                      spacing: 10.0,
                      runSpacing: 10.0,
                      children: imageWidgets,
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),



                    
                            // SizedBox(
                            //   width: 100,
                            //   child: Padding(
                            //     padding: EdgeInsets.only(top: 10.0),
                            //     child: Image.asset(
                            //       'images/profile.png',
                            //       width: 60,
                            //       height: 60,
                            //     ),
                            //   ),
                            // ),
                          ),
                        ],
                      ),
                    ),

                        ],  
                      ),
                    ],
                  ),
          ),

// wisata rekomendasi

  Container(
  margin: EdgeInsets.only(top: 20.0),
  width: 350.0,
  height: 350.0,
  decoration: BoxDecoration(
    color: Color(0xffB4E9FF),
    borderRadius: BorderRadius.circular(20.0),
  ),
  child: Stack(
    children: [
      GoogleMap(
        onMapCreated: (controller) {
          mapController = controller;
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(-8.1721, 113.7007), // Koordinat Jember
          zoom: 15.0,
        ),
      ),
      Positioned(
        top: 260.0,
        left: 150.0,
        child: GestureDetector(
          onTap: () {
            // Aksi yang dijalankan saat gambar diklik
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyMapScreen()),
            );
          },
          child: Image.asset(
            'images/map.png', // Path dan nama file gambar
            width: 70.0,
            height: 70.0,
          ),
        ),
      ),
    ],
  ),
),




  Container(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        margin: EdgeInsets.only(top: 30.0),
        width: 350.0,
        height: 40.0,
        decoration: BoxDecoration(
          color: Color(0xffB4E9FF),
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: EdgeInsets.only(left: 30.0),
        child: Material(
          color: Colors.transparent,
          child: Ink(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(20.0),
              onTap: () {
                // Aksi yang dijalankan saat tombol diklik
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WatuUlo()),
                );
              },
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Pantai Watu Ulo",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ],
  ),
),

  Container(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        margin: EdgeInsets.only(top: 10.0),
        width: 350.0,
        height: 40.0,
        decoration: BoxDecoration(
          color: Color(0xffB4E9FF),
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: EdgeInsets.only(left: 30.0),
        child: Material(
          color: Colors.transparent,
          child: Ink(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(20.0),
              onTap: () {
                // Aksi yang dijalankan saat tombol diklik
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Sukorambi()),
                );
              },
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Sukorambi Botanical Garden",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ],
  ),
),
  Container(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        margin: EdgeInsets.only(top: 10.0),
        width: 350.0,
        height: 40.0,
        decoration: BoxDecoration(
          color: Color(0xffB4E9FF),
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: EdgeInsets.only(left: 30.0),
        child: Material(
          color: Colors.transparent,
          child: Ink(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(20.0),
              onTap: () {
                // Aksi yang dijalankan saat tombol diklik
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Papuma()),
                );
              },
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Pantai Papuma",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ],
  ),
),
  
  Container(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        margin: EdgeInsets.only(top: 10.0, bottom: 40.0),
        width: 350.0,
        height: 40.0,
        decoration: BoxDecoration(
          color: Color(0xffB4E9FF),
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: EdgeInsets.only(left: 30.0),
        child: Material(
          color: Colors.transparent,
          child: Ink(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(20.0),
              onTap: () {
                // Aksi yang dijalankan saat tombol diklik
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelukLove()),
                );
              },
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Teluk Love",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ],
  ),
),    

// map asdasdasdasdadasdadsadddddddddd
        
        ],
      ),
        ],
      )


              

            
              // children: [
              //   Text(
              //     widget.userCredential.user?.displayName ?? "Null",
              //     style: TextStyle(
              //       color: Colors.white, // Warna teks
              //       fontSize: 20.0,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              //   IconButton(
              //     onPressed: () {
              //       GoogleAuth.logout().then((_) {
              //         Navigator.pushAndRemoveUntil(
              //           context,
              //           MaterialPageRoute(
              //             builder: (_) => const LoginPage(),
              //           ),
              //           (route) => false,
              //         );
              //       });
              //     },
              //     icon: Icon(
              //       Icons.logout_rounded,
              //       color: Colors.white, // Warna ikon
              //     ),
              //   ),
              // ],

    );
  }
}

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
      
//       appBar: AppBar(
//         title: Text(
//           widget.userCredential.user?.displayName ?? "Null",
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               GoogleAuth.logout().then((_) {
//                 Navigator.pushAndRemoveUntil(
//                     context,
//                     MaterialPageRoute(
//                       builder: (_) => const LoginPage(),
//                     ),
//                     (route) => false);
//               });
//             },
//             icon: Icon(Icons.logout_rounded),
//           )
//         ],
//         automaticallyImplyLeading: false,
//       ),
      
//     );
//   }
// }
