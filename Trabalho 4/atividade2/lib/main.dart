import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Responsive Layouts',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Atividade responsivo'),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: Colors.grey[800], height: 1.0),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return Row(
              children: [
                const Expanded(child: LeftPanelLandscape()),
                Container(width: 1.0, color: Colors.grey[800]),
                const Expanded(child: RightPanel()),
              ],
            );
          } else {
            return const PortraitPanel();
          }
        },
      ),
    );
  }
}

class LeftPanelLandscape extends StatelessWidget {
  const LeftPanelLandscape({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Cheetah Coding',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 30),
          SizedBox(width: 300, height: 60, child: MyButton(label: 'BUTTON 1')),
          SizedBox(height: 20),
          SizedBox(width: 300, height: 60, child: MyButton(label: 'BUTTON 2')),
        ],
      ),
    );
  }
}

class PortraitPanel extends StatelessWidget {
  const PortraitPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        const Text(
          'IFSP Coding',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 30),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyButton(label: 'BOTÃO 1'),
            SizedBox(width: 20),
            MyButton(label: 'BOTÃO 2'),
          ],
        ),
        const SizedBox(height: 30),
        Expanded(child: const RightPanel()),
      ],
    );
  }
}

class MyButton extends StatelessWidget {
  final String label;
  const MyButton({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black87,
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        elevation: 0,
        shape: const RoundedRectangleBorder(),
      ),
      child: Text(label),
    );
  }
}

class RightPanel extends StatelessWidget {
  const RightPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> techList = ['Dart', 'JavaScript', 'PHP', 'C++', 'React'];
    return ListView.builder(
      itemCount: techList.length,
      itemBuilder: (context, index) {
        return TechListItem(techName: techList[index]);
      },
    );
  }
}

class TechListItem extends StatelessWidget {
  final String techName;
  const TechListItem({super.key, required this.techName});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[800]!)),
      ),
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Text(
          techName,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
        ),
      ),
    );
  }
}
