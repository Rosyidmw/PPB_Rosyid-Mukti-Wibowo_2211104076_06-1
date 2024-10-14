import 'package:flutter/material.dart';
import 'package:praktikum_4/list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LatihanListView(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text("He'd have you all unravel at the"), 
            color: Colors.teal[100], 
          ),
           Container( 
            padding: const EdgeInsets.all(8), 
            child: const Text('Heed not the rabble'), 
            color: Colors.teal[200], 
          ), 
          Container( 
            padding: const EdgeInsets.all(8), 
            child: const Text('Sound of screams but the'), 
            color: Colors.teal[300], 
          ), 
          Container( 
            padding: const EdgeInsets.all(8), 
            child: const Text('Who scream'), 
            color: Colors.teal[400], 
          ), 
          Container( 
            padding: const EdgeInsets.all(8), 
            child: const Text('Revolution is coming...'), 
            color: Colors.teal[500], 
          ), 
          Container( 
            padding: const EdgeInsets.all(8), 
            child: const Text('Revolution, they...'), 
            color: Colors.teal[600], 
          ),
        ],
        ),
    );
  }
}
