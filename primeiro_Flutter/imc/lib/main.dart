import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de IMC',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Calcular IMC'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _alturaController = TextEditingController();
  TextEditingController _pesoController = TextEditingController();

  String _resultado = '';

  void _calcularIMC() {
    double? altura = double.tryParse(_alturaController.text);
    double? peso = double.tryParse(_pesoController.text);

    if (altura != null && peso != null && altura > 0) {
      double imc = peso / (altura * altura);

      setState(() {
        _resultado = 'Seu IMC é: ${imc.toStringAsFixed(2)}\n';

        if (imc < 18.5) {
          _resultado += 'Abaixo do peso';
        } else if (imc >= 18.5 && imc < 24.9) {
          _resultado += 'Peso Normal';
        } else if (imc >= 25 && imc < 29.9) {
          _resultado += 'Sobrepeso';
        } else {
          _resultado += 'Obesidade';
        }
      });
    } else {
      setState(() {
        _resultado = 'Por favor, insira valores válidos para peso e altura';
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
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Container(
              margin: EdgeInsets.only(bottom: 10, left: 51, right: 51),
              width: double.infinity,
              // Aqui inserimos uma imagem
              // Não pode ser qualquer imagem, em que ser de fonte confiável
              // por questão de segurança. Nem todas as imagens são exibidas
              // com sucesso. Muitas dão erro. Procurem imagens do wikipedia,
              // pois a maioria funciona bem.
              child: Image.network(
                "https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/Obesity-waist_circumference.svg/300px-Obesity-waist_circumference.svg.png", // Substitua pela URL real ou use assets
 
                fit: BoxFit.fill,
              ),
            ),

            TextField(
              controller: _alturaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Informe a altura em metros ex: (1.75)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _pesoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Informe se peso em kg',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularIMC,
              child: Text('Calcular IMC'),
            ),
            SizedBox(height: 20),
            Text(
              _resultado,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
