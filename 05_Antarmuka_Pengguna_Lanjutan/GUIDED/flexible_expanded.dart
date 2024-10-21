import 'package:flutter/material.dart';

class FlexibleExpendedScreen extends StatelessWidget {
  const FlexibleExpendedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flexible & Extended'),
        backgroundColor: Colors.cyan,
      ),
      body: Column(
        children: [
          const Text('Flexible'),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                width: 50,
                height: 100,
                color: Colors.red,
                child: const Text('Ini tanpa flexible '),
              ),
              Flexible(
                child: Container(
                  height: 100,
                  color: Colors.yellow,
                  child: const Text('This is Flexible Widget, it takes up the remaining space but can shrink if needed'),
                )
              ),
              const Icon(Icons.sentiment_dissatisfied)
            ],
          ),

          const SizedBox(
            height: 10,
          ),
          const Text('Expanded'),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Container(
                width: 50,
                height: 100,
                color: Colors.blue,
              ),
              Expanded(
                child: Container(
                  height: 100,
                  color: Colors.yellow,
                  child: const Text('This is Expanded Widget, it force the widget to take up all the remaining app'),
                ),
              ),
              const Icon(Icons.sentiment_neutral)
            ],
          )
        ],
      ),
    );
  }
}