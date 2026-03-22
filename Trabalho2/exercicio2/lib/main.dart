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
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.call, color: Colors.deepPurple, size: 30),
                  Text(
                    'CALL',
                    style: TextStyle(color: Colors.deepPurple, fontSize: 12),
                  ),
                ],
              ),

              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.near_me, color: Colors.deepPurple, size: 30),
                  Text(
                    'ROUTE',
                    style: TextStyle(color: Colors.deepPurple, fontSize: 12),
                  ),
                ],
              ),

              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.share, color: Colors.deepPurple, size: 30),
                  Text(
                    'SHARE',
                    style: TextStyle(color: Colors.deepPurple, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
