import 'package:flutter/material.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Page"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Text("Nama"),
          const TextField(),
          const Text("NIM"),
          const TextField(),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Simpan"),
          )
        ],
      ),
    );
  }
}
