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
          title: Text('Insert Image Example'),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: SizedBox(
                height: 180,
                width: 350,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image.network('https://i.imgur.com/VwI9gTq.jpeg'),
                ),
              ),
            ),

            SizedBox(height: 30),

            Image.network(
              'https://i.imgur.com/dFN26lN.jpeg',
              width: 450,
              height: 300,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
