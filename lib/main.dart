import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:hive_provider/person.dart';
import 'hive_registrar.g.dart'; // Importar para carregar os adapters

void main() async {
  Hive.registerAdapters(); // Carrega os adapters

  await Hive.initFlutter(); // Inicia o Hive
  // Abre a box
  final box = await Hive.openBox("testBox");
  // Insere um par chave/valor (name/David)
  box.put("name", "David");

  // Adicionando Objeto ao Hive
  final boxPeople = await Hive.openBox("people");
  final marcelo = Person("Marcelo", 30);
  marcelo.addFriend(Person("Carol", 40));
  // O Adapter de Person sabe como armazenar no Hive
  boxPeople.put(marcelo.name, marcelo);

  runApp(MaterialApp(home: MainApp()));
}

class MainApp extends StatelessWidget {
  Future<String> getValueFromHive() async {
    final box = await Hive.openBox("testBox");
    return box.get("name"); // Recupera o "David"
  }

  Future<Person?> getPerson() async {
    final box = await Hive.openBox("people");
    return box.get("Marcelo"); // Recupera o objeto "Marcelo"
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder(
            future: getValueFromHive(),
            builder: (context, snapshot) {
              return Center(child: Text('${snapshot.data}'));
            },
          ),

          FutureBuilder(
            future: getPerson(),
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
    );
  }
}
