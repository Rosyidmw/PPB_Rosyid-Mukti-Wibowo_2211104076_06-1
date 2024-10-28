import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyPackage extends StatelessWidget {
  const MyPackage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Package',
          style: GoogleFonts.poppins(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const TextField(
              obscureText: false,
              obscuringCharacter: "*",
              decoration: InputDecoration(
                  // icon: Icon(Icons.person),
                  prefixIcon: Icon(Icons.person),
                  hintText: "Masukkan Username",
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 18,
            ),
            const TextField(
              obscureText: true,
              obscuringCharacter: "*",
              decoration: InputDecoration(
                  // icon: Icon(Icons.person),
                  prefixIcon: Icon(Icons.lock),
                  hintText: "Masukkan Password",
                  border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
