import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tugas_api/pages/add.dart';
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
      appBar: AppBar(
        title: Text(
          widget.userCredential.user?.displayName ?? "Null",
        ),
        actions: [
          IconButton(
            onPressed: () {
              GoogleAuth.logout().then((_) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const LoginPage(),
                    ),
                    (route) => false);
              });
            },
            icon: Icon(Icons.logout_rounded),
          )
        ],
        automaticallyImplyLeading: false,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const AddPage(),
          ),
        ),
        child: const Icon(Icons.add),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Name"),
            subtitle: Text("NIM"),
            onTap: () {},
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.delete,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
