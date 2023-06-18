import 'package:flutter/material.dart';
import 'package:tugas_api/pages/home.dart';
import 'package:tugas_api/services/google_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.only(top: 40.0,bottom: 100.0),
            child:  Image.asset('images/Splash_screen.png',
            height: 100.0,
            width: 100.0,),
            ),
            const Text(
              "Welcome",
              style: TextStyle(fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Color(0xff19A7CE)),
            ),
            const Text(
              "Back Traveler!",
              style: TextStyle(fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Color(0xff19A7CE)),
            ),
            SizedBox(height: 20.0,),
            const Text(
              "Silahkan Login ke akun anda",
              style: TextStyle(fontSize: 23,),
            ),
            SizedBox(height: 70.0,),
            ElevatedButton(
              onPressed: () {
                GoogleAuth.signInWithGoogle().then((value) {
                  if (value.user != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => HomePage(
                          userCredential: value,
                        ),
                      ),
                    );
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                backgroundColor: Color(0xff19A7CE),
                fixedSize: Size(350, 40)
              ),
              child: const Text("Login with google"),
            )
          ],
        ),
      ),
    );
  }
}
