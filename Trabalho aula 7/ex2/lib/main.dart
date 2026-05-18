import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'contador.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Contador(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ContadorPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ContadorPage extends StatelessWidget {
  const ContadorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador com Provider'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Valor atual do contador:',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            Consumer<Contador>(
              builder: (context, contador, child) {
                return Text(
                  '${contador.valor}',
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Provider.of<Contador>(context, listen: false).decrementar();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                  ),
                  child: const Text(
                    'Decrementar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<Contador>(context, listen: false).incrementar();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text(
                    'Incrementar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
