import 'package:flutter/material.dart';
import 'package:kuis/views/home.dart';
import 'package:kuis/views/profile.dart';

class Root extends StatefulWidget {
  final String username;
  const Root({super.key, required this.username});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const HomePage(),
      ProfilePage(username: widget.username),
    ];
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
