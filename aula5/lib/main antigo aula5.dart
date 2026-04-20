// import 'package:aula5/widget/grid_data.dart';
// import 'package:aula5/widget/list_data.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(home: MyApp()));
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: LayoutBuilder(
//         builder: (context, sizes) {
//           if (sizes.maxWidth < 500) {
//             return ListData();
//           }
//           return GridData();
//         },
//       ),

//       // Center(
//       //   child: SizedBox(
//       //     height: 300,
//       //     child: Card(
//       //       child: Column(
//       //         children: [
//       //           ListTile(
//       //             title: const Text(
//       //               '1625 Main Street',
//       //               style: TextStyle(fontWeight: FontWeight.w500),
//       //             ),
//       //             subtitle: const Text('My City, CA 99984'),
//       //             leading: Icon(Icons.restaurant_menu, color: Colors.blue[500]),
//       //           ),
//       //           const Divider(), // Linha divisória
//       //           ListTile(
//       //             title: const Text(
//       //               '(408) 555-1212',
//       //               style: TextStyle(fontWeight: FontWeight.w500),
//       //             ),
//       //             leading: Icon(Icons.contact_phone, color: Colors.blue[500]),
//       //           ),
//       //           ListTile(
//       //             title: const Text('costa@example.com'),
//       //             leading: Icon(Icons.contact_mail, color: Colors.blue[500]),
//       //           ),
//       //         ],
//       //       ),
//       //     ),
//       //   ),

//       //   // child: GridView.builder(
//       //   //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//       //   //     crossAxisCount: 2,
//       //   //   ),
//       //   //   itemCount: 20,
//       //   //   itemBuilder: (context, index) {
//       //   //     return Image.network("https://picsum.photos/20${index}");
//       //   //   },
//       //   // ),

//       //   // child: GridView.count(
//       //   //   crossAxisCount: 3,
//       //   //   children: List.generate(
//       //   //     6,
//       //   //     (index) =>
//       //   //         Container(color: Colors.lightBlue[int.parse("${index}00")]),
//       //   //   ),
//       //   // ),
//       // ),
//     );
//   }
// }
