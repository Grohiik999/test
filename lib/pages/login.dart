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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Firebase app",
              style: TextStyle(fontSize: 30),
            ),
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
              child: const Text("Login with google"),
            )
          ],
        ),
      ),
    );
  }
}
