import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MainApp()));
}

class MainApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainAppState();
  }
}

enum Opcoes { opcao1, opcao2, opcao3 }

DateTime selectedDate = DateTime.now();

class MainAppState extends State<MainApp> {
  String helloText = "Hello World";
  Opcoes _opcao = Opcoes.opcao1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(child: exampleRadio()),
            exampleCheckbox(),
            exampleSlider(),
            Text(_slider.toString()),
            ElevatedButton(
              onPressed: () {
                selectDate(context);
              },
              child: Text("Selecione a data"),
            ),
            Text(selectedDate.toString()),
          ],
        ),
      ),
    );
  }

  RadioGroup<Opcoes> exampleRadio() {
    return RadioGroup<Opcoes>(
      groupValue: _opcao,
      onChanged: (Opcoes? value) {
        setState(() {
          _opcao = value!;
        });
      },
      child: Column(
        children: [
          ListTile(
            title: const Text("Minha primeira opção"),
            leading: Radio(value: Opcoes.opcao1),
          ),
          ListTile(
            title: const Text("Minha segunda opção"),
            leading: Radio(value: Opcoes.opcao2),
          ),
        ],
      ),
    );
  }

  bool _checked = false;
  ListTile exampleCheckbox() {
    return ListTile(
      title: Text("concorde com os termos"),
      leading: Checkbox(
        value: _checked,
        onChanged: (value) {
          setState(() {
            _checked = value!;
          });
        },
      ),
    );
  }

  double _slider = 99;
  ListTile exampleSlider() {
    return ListTile(
      title: Text("Temperatura"),
      leading: SizedBox(
        width: 300,
        child: Slider(
          value: _slider,
          max: 100,
          divisions: 10,
          onChanged: (value) {
            setState(() {
              _slider = value;
            });
          },
        ),
      ),
    );
  }

  Future<void> selectDate(BuildContext ctx) async {
    final DateTime? picked = await showDatePicker(
      context: ctx,
      initialDate: selectedDate,
      firstDate: DateTime(2023, 8),
      lastDate: DateTime(2027, 1),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  List<Widget> example1() {
    return [
      Text(helloText),
      ElevatedButton(
        onPressed: () {
          setState(() {
            helloText = "olá mundo";
          });
        },
        child: const Text('Clique'),
      ),
    ];
  }
}
