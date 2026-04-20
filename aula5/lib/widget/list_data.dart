import 'package:flutter/material.dart';

class ListData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 100,
      itemBuilder: (context, id) {
        return ListTile(leading: Icon(Icons.add_box), title: Text("Item $id"));
      },
    );
  }
}
