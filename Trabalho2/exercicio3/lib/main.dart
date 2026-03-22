import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stack & Positioned Widget'),
          backgroundColor: Colors.blue,
        ),
        body: Stack(
          children: [
            Positioned(
              top: 50,
              left: 50,
              child: Container(
                width: 200,
                height: 200,
                color: Colors.green[400],
                child: Text(
                  'Green',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),

            Positioned(
              top: 100,
              left: 80,
              child: Container(
                width: 200,
                height: 200,
                color: Colors.red[400],
                child: Text(
                  'Red',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),

            Positioned(
              top: 150,
              left: 110,
              child: Container(
                width: 200,
                height: 200,
                color: Colors.purple[300],
                child: Text(
                  'Purple',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
