import 'package:flutter/material.dart';

class GridData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = size.height / 2;
    final double itemWidth = size.width / 2;
    return GridView.count(
      crossAxisCount: 3,
      childAspectRatio: (itemWidth / itemHeight),
      children: List.generate(100, (index) {
        return Center(
          child: ListTile(
            leading: Icon(Icons.add_box),
            title: Text("Item $index"),
          ),
        );
      }),
    );
  }
}
