import 'package:flutter/material.dart';

class LatihanListView extends StatelessWidget {
  const LatihanListView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> listContainer = [
          Container(
            height: 300,
            color: Colors.amber,
            child: const Center(child: Text('Type A'),),
            margin: EdgeInsets.all(10),
          ),
          Container( 
            height: 350, 
            color: Colors.blue, 
            child: const Center(child: Text('Type B'))
          ), 
          Container( 
            height: 250, 
            color: Colors.amber[100], 
            child: const Center(child: Text('Type C')), 
          ),
          Container(
            height: 230,
            color: Colors.amber,
            child: const Center(child: Text('Type D'),),
          ),
          Container( 
            height: 190, 
            color: Colors.cyan, 
            child: const Center(child: Text('Type E'))
          ), 
          Container( 
            height: 120, 
            color: Colors.amber[100], 
            child: const Center(child: Text('Type F')), 
          ),
        ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Latihan List View"),
        backgroundColor: Colors.cyan,
      ),
      body: ListView.builder(
        itemCount: listContainer.length,
        itemBuilder: (context, index) {
          return listContainer[index];
        },
      )
    );
  }
}