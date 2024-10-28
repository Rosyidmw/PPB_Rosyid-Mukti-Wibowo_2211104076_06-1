import 'package:flutter/material.dart';

class MyTabBarState extends StatefulWidget {
  const MyTabBarState({super.key});

  @override
  State<MyTabBarState> createState() => _MyTabBarStateState();
}

class _MyTabBarStateState extends State<MyTabBarState> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, 
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Contoh Tab Bar'),
          backgroundColor: Colors.amber,
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.food_bank),
                text: 'Menu',
              ),
              Tab(
                icon: Icon(Icons.calendar_month),
                text: 'Schedule',
              ),
              Tab(
                icon: Icon(Icons.history),
                text: 'History',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(
              child: Text('Ini konten menu'),
            ),
            Center(
              child: Text('Ini konten schedule'),
            ),
            Center(
              child: Text('Ini konten history'),
            ),
          ],
        ),
      ),
    );
  }
}