import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services/google_auth.dart';
import 'login.dart';

class Profile extends StatefulWidget {
  final UserCredential userCredential;
  const Profile({super.key, required this.userCredential});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
                    Padding(padding: EdgeInsets.only(top: 30.0),
                    child:  Image.asset('images/profile.png',
                    // width: 700.0,
                    height: 100.0,),
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
                Padding(padding: EdgeInsets.only(top: 30.0),
                    child: Image.asset(
                      'images/Splash_screen.png',
                      width: 100.0,
                      height: 100.0,
                    ),),

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
                            "Log Out",
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