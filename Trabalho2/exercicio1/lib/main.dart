import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: HomePage(), debugShowCheckedModeBanner: true));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter is Fun!'),
        backgroundColor: Colors.green,
      ),
      body: Stack(
        children: [
          Positioned(
            top: 80,
            left: 80,
            child: Container(
              width: 150,
              height: 150,
              color: Colors.deepOrange,
              child: const Text('Hi Mom 🐣', style: TextStyle(fontSize: 18)),
            ),
          ),
        ],
      ),
    );
  }
}
