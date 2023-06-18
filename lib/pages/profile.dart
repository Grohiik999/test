import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../services/google_auth.dart';
import 'login.dart';
import 'dart:io';

class Profile extends StatefulWidget {
  final UserCredential userCredential;
  const Profile({super.key, required this.userCredential});
  
  

  @override
  State<Profile> createState() => _ProfileState();
  
}

class _ProfileState extends State<Profile> {
  
  String imageUrl = '';
  bool showLocalFile = false;

  

  // Future<void> _getImageFromCamera() async {
  //   final pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);
  //   if (pickedImage != null) {
  //     setState(() {
  //       _image = File(pickedImage.path);
  //     });
  //   }
  // }

//   Future<void> pickAndUploadImage() async {
//   /*Langkah 1: Ambil gambar*/
//   ImagePicker imagePicker = ImagePicker();
//   XFile? file = await imagePicker.pickImage(source: ImageSource.camera);
//   print('${file?.path}');

//   if (file == null) return;

//   /*Langkah 2: Unggah ke Firebase Storage*/
//   var fileName = widget.userCredential.user!.email.toString() + '.jpg';
//   Reference storageReference =
//       FirebaseStorage.instance.ref().child('images').child(fileName);

//   try {
//     await storageReference.putFile(File(file.path));
//     String imageUrl = await storageReference.getDownloadURL();
//     print('Gambar diunggah: $imageUrl');

//     /*Langkah 3: Kirim data gambar ke Firestore*/
//     FirebaseFirestore firestore = FirebaseFirestore.instance;
//     Map<String, dynamic> imageData = {
//       'gambar': imageUrl,
//     };

//     // Kirim data gambar ke koleksi 'images' dengan dokumen baru yang secara otomatis dihasilkan ID-nya
//     firestore.collection('images').add(imageData).then((DocumentReference document) {
//       print('Data gambar berhasil dikirim dengan ID: ${document.id}');
//     }).catchError((error) {
//       print('Gagal mengirim data gambar: $error');
//     });
//   } catch (error) {
//     print('Gagal mengunggah gambar: $error');
//   }
// }

void pickAndUploadImage() async {
  final image = await ImagePicker().pickImage(source: ImageSource.camera,
    maxWidth: 100.0,
    maxHeight: 100.0,
  );

  Reference ref = FirebaseStorage.instance.ref().child('profilepic.jpg');

  await ref.putFile(File(image!.path));
  ref.getDownloadURL().then((value) => {
    print(value),
    setState(() {
      imageUrl = value;
    })
  });

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference profileCollection = firestore.collection('gambar');

  Map<String, dynamic> dataToSend = {
  'images': imageUrl,
};

profileCollection.add(dataToSend);

}

Future<List<QueryDocumentSnapshot>> fetchData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('gambar').get();
    return querySnapshot.docs;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // alignment: Alignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                ),
            height: kToolbarHeight + MediaQuery.of(context).padding.top + 120.0,
            decoration: BoxDecoration(
              color: Color(0xff19A7CE),
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
                    Padding(padding: EdgeInsets.only(top: 30.0),
                    child: Image.asset(
                      'images/Splash_screen.png',
                      width: 100.0,
                      height: 100.0,
                    ),),
                  ],
                )
              ],
            ),
          ),

          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(margin: EdgeInsets.only(top: 160.0),
                width: 340.0,
                height: 300.0,
                decoration: BoxDecoration(
                  color: Color(0xffB4E9FF),
                  borderRadius: BorderRadius.circular(30.0)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.only(top: 40.0),
                    child: FutureBuilder<List<QueryDocumentSnapshot>>(future: fetchData(),
                    builder: (BuildContext context,AsyncSnapshot<List<QueryDocumentSnapshot>>snapshot) {
                      if (snapshot.hasData) {
                        List<QueryDocumentSnapshot> data = snapshot.data!;
                        List<Widget> imageWidgets = data.map((document) {
                        Map<String, dynamic> documentData = document.data() as Map<String, dynamic>;
                        return documentData['images'] == "" 
                        ? Image.asset('images/profile.png',
                        width: 100.0,
                        height: 100.0,) :
                        Image.network(
                          documentData['images'],
                          width: 100,
                          height: 100,
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
                    },)
                    
                      // imageUrl == "" 
                      // ? Image.asset("images/profile.png",
                      //   width: 100.0,
                      //   height: 100.0,
                      // ) : Image.network(
                      //   imageUrl,
                      //   width: 100,
                      //   height: 100,
                      // )
                          ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(padding: EdgeInsets.only(top: 10.0),
                          child: Title(color: Colors.black, child: Text(
                            widget.userCredential.user?.displayName ?? "Null",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          ),
                          ),
                        ],
                      ),
                    ),
                    Container(child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(padding: EdgeInsets.only(top: 50.0,
                        left: 20.0,right: 20.0),
                        child: Text(
                          widget.userCredential.user?.email ?? "Null",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal
                          ),
                        ),
                        )
                      ],
                    ),),
                  ],
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
                  margin: EdgeInsets.only(top: 350.0),
                  width: 300.0,
                  height: 3.0,
                  decoration: BoxDecoration(
                    color: Color(0xff19A7CE),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ],
            ),
            ),

    // Navigation bottom
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 800.0),
                  width: 392.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: Color(0xff19A7CE),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)
                      ),
                  ),
                ),
              ],
            ),
            ),
            
                Padding(padding: EdgeInsets.only(top: 750.0,left: 150.0),
                    child:FutureBuilder(builder: 
                      (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                           return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return InkWell(
                            onTap: () {
                              snapshot.connectionState != ConnectionState.waiting
                                ? pickAndUploadImage()
                                : null;
                            },
                            child: SizedBox(
                              child: GestureDetector(
                                onTap: () {
                                  snapshot.connectionState != ConnectionState.waiting
                                    ? pickAndUploadImage()
                                    : null;
                                },
                                child: Image.asset(
                                  'images/camera_icon.png',
                                  height: 100.0,
                                  width: 100.0,
                                ),
                              ),
                            ),
                          );
                        }
                      }
                    )
            ),

          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 500.0),
                  width: 330.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: Color(0xff19A7CE),
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
                          Navigator.pop(context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Kembali       ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
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
                  margin: EdgeInsets.only(top: 560.0),
                  width: 330.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: Color(0xff19A7CE),
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
                          GoogleAuth.logout().then((_) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const LoginPage(),
                              ),
                              (route) => false,
                            );
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Log Out         ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
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
        ],
      ),
    );
  }
}