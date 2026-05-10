import 'package:flutter/material.dart';
import 'package:aula7/hive_registrar.g.dart';
import 'package:hive_ce/hive_ce.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:aula7/person.dart';

void main() async {
  Hive.registerAdapters();
  await Hive.initFlutter();
  final box = await Hive.openBox('boxTest');
  box.put('name', 'David');

  final boxPerson = await Hive.openBox("boxPerson");
  final david = Person("david", 30);
  david.addFriend(Person("Carol", 40));
  boxPerson.put(david.name, david);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<String> getDataFromHive() async {
    final box = await Hive.openBox('boxTest');
    return box.get('name');
  }

  Future<String> getDataFromPerson() async {
    final box = await Hive.openBox('boxPerson');
    return box.get('david');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              FutureBuilder(
                future: getDataFromHive(),
                builder: (context, snapshot) {
                  var name = snapshot.data;
                  return Text('Olá mundo, ${name}!');
                },
              ),
              Divider(),
              FutureBuilder(
                future: getDataFromPerson('david'),
                builder: (context, snapshot) {
                  Person? p = snapshot.data;
                  var friendsWidgets = [];
                  for (var f in p!.friends) {
                    friendsWidgets.add(Text("${f.name} - ${f.age} anos"));
                  }
                  return Center(
                    child: Column(
                      children: [
                        Text("${p.name} - ${p.age} anos"),
                        Divider(),
                        Text("AMIGOS"),
                        ...friendsWidgets,
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
