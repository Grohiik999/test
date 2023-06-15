import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tugas_api/pages/login.dart';
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
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 20,
              left: 16.0,
              right: 16.0,
            ),
            height: kToolbarHeight + MediaQuery.of(context).padding.top + 120.0,
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
                Text(
                  widget.userCredential.user?.displayName ?? "Null",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 100,),
                Padding(padding: 
                  EdgeInsets.only(top: 10.0),
                  child: Image.asset('images/profile.png',
                  width: 60,
                  height: 60,
                  ),
                  
                )
              ],
            ),
          ),
                  ],  
                )
              ],
            ),

            
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
          ),

          
        ],
      ),
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
