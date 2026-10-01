import 'package:flutter/material.dart';
import 'package:kuis/views/login.dart';

class ProfilePage extends StatelessWidget {
  final String username;

  const ProfilePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.person, size: 52),
            const SizedBox(height: 10),
            Text(username),
            const SizedBox(height: 16),
            TextButton.icon(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (route) => false,
                );
              },
              icon: const Icon(Icons.logout, size: 18),
              label: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
