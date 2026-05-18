import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  await Hive.openBox('settingsBox');

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ModeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ModeScreen extends StatefulWidget {
  const ModeScreen({super.key});

  @override
  State<ModeScreen> createState() => _ModeScreenState();
}

class _ModeScreenState extends State<ModeScreen> {
  late Box settingsBox;
  bool isRelaxMode = true;

  @override
  void initState() {
    super.initState();
    settingsBox = Hive.box('settingsBox');

    isRelaxMode = settingsBox.get('isRelaxMode', defaultValue: true);
  }

  void _toggleMode() {
    setState(() {
      isRelaxMode = !isRelaxMode;
      settingsBox.put('isRelaxMode', isRelaxMode);
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = isRelaxMode ? Colors.blue : Colors.green;
    final String centerText = isRelaxMode ? "Modo Relax" : "Modo Focado";

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: _toggleMode,
          child: Text(centerText),
        ),
      ),
    );
  }
}
