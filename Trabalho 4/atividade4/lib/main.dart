import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FlutterFormDemo(),
    ),
  );
}

class FlutterFormDemo extends StatefulWidget {
  const FlutterFormDemo({super.key});

  @override
  State<FlutterFormDemo> createState() => _FlutterFormDemoState();
}

class _FlutterFormDemoState extends State<FlutterFormDemo> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _dobController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  void _submitData() {
    final snackBar = SnackBar(
      content: Text(
        'Nome: ${_nameController.text}\n'
        'Telefone: ${_phoneController.text}\n'
        'Nascimento: ${_dobController.text}',
      ),
      duration: const Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exemplo de Form'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildInputRow(Icons.person, 'Nome', _nameController),
            const SizedBox(height: 10),
            _buildInputRow(Icons.phone, 'Telefone', _phoneController),
            const SizedBox(height: 10),
            _buildInputRow(Icons.calendar_today, 'Nascimento', _dobController),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _submitData,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[400],
                foregroundColor: Colors.black54,
                shape: const RoundedRectangleBorder(),
              ),
              child: const Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputRow(
    IconData icon,
    String label,
    TextEditingController controller,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Icon(icon, color: Colors.grey[700]),
        const SizedBox(width: 20),
        Expanded(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: label,
              labelStyle: const TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
