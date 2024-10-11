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
      title: 'Tabuada',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 86, 197, 160)),
        useMaterial3: true,
      ),
      home: const TabuadaPage(title: 'Tabuada'),
    );
  }
}

class TabuadaPage extends StatefulWidget {
  const TabuadaPage({super.key, required this.title});

  final String title;

  @override
  State<TabuadaPage> createState() => _TabuadaPageState();
}

class _TabuadaPageState extends State<TabuadaPage> {
  TextEditingController _numeral = TextEditingController();
  String _resultado = '';

  void _CalcularTabuada() {
    int? numero = int.tryParse(_numeral.text);
    if (numero != null) {
      setState(() {
        _resultado = '';
        for (int i = 1; i <= 10; i++) {
          _resultado += '$numero x $i = ${numero * i}\n';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(children: [
          TextField(
            controller: _numeral,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Informe um numero',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: _CalcularTabuada, child: Text('Calcular Tabuada')),
          SizedBox(height: 20),
          Text(
            _resultado,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ]),
      ),
    );
  }
}
