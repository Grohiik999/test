import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tugas_api/pages/login.dart';
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
  @override
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
                            child: SizedBox(
                              width: 100,
                              child: Padding(
                                padding: EdgeInsets.only(top: 10.0),
                                child: Image.asset(
                                  'images/profile.png',
                                  width: 60,
                                  height: 60,
                                ),
                              ),
                            ),
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
