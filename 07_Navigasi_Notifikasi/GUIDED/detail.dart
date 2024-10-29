import 'package:flutter/material.dart';

class DetailProduk extends StatelessWidget {
  const DetailProduk({super.key, required this.data});

  final String data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ini Adalah Detail'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Text(data),
      ),
    );
  }
}