import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            fontSize: 62,
            color: Colors.amber,
            backgroundColor: Colors.blue,
          ),
        ),
      ),
      home: Homepage(),
      // Scaffold(
      //   appBar: AppBar(title: Text("Meu App")),
      //   drawer: Drawer(
      //     child: ListView(
      //       children: [
      //         ListTile(
      //           leading: const Icon(Icons.phishing),
      //           title: Text("Opção 1"),
      //         ),
      //         ListTile(
      //           leading: const Icon(Icons.phone),
      //           title: Text("Opção 2"),
      //         ),
      //       ],
      //     ),
      //   ),
      //   body: Center(
      //     child: Text(
      //       "Olá Mundo",
      //       style: TextStyle(
      //         color: Theme.of(context).textTheme.titleMedium!.color,
      //       ),
      //     ),
      //   ),
      //   floatingActionButton: FloatingActionButton(
      //     onPressed: () {},
      //     backgroundColor: Colors.red,
      //     child: const Icon(Icons.add),
      //   ),
      //   bottomNavigationBar: BottomNavigationBar(
      //     items: const <BottomNavigationBarItem>[
      //       BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.business),
      //         label: 'Business',
      //       ),
      //       BottomNavigationBarItem(icon: Icon(Icons.school), label: 'School'),
      //     ],
      //   ),
      // ),
    );
  }
}

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: () {}, child: Text("random number")),
      ),
    );
  }
}
