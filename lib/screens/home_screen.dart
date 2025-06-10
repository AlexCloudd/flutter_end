import 'package:flutter/material.dart';
import 'implicit_animations.dart';
import 'explicit_animations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter анимации!!!!'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ImplicitAnimationsScreen()),
                );
              },
              child: const Text('Имплицитные анимации'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ExplicitAnimationsScreen()),
                );
              },
              child: const Text('Явные анимации'),
            ),
          ],
        ),
      ),
    );
  }
}