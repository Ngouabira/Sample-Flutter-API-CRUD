import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  var nombre1 = TextEditingController();
  var nombre2 = TextEditingController();
  var resultat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculator')),
      body: Column(children: [
        TextFormField(
          controller: nombre1,
          decoration: const InputDecoration(hintText: "Nombre 1"),
        ),
        TextFormField(
          controller: nombre2,
          decoration: const InputDecoration(hintText: "Nombre 2"),
        ),
        Row(
          children: [
            OutlinedButton(
                onPressed: () {
                  setState(() {
                    resultat =
                        double.parse(nombre1.text) + double.parse(nombre2.text);
                  });
                },
                child: const Text("+")),
            OutlinedButton(
                onPressed: () {
                  setState(() {
                    resultat =
                        double.parse(nombre1.text) - double.parse(nombre2.text);
                  });
                },
                child: const Text("-")),
            OutlinedButton(
                onPressed: () {
                  setState(() {
                    resultat =
                        double.parse(nombre1.text) * double.parse(nombre2.text);
                  });
                },
                child: const Text("*")),
            OutlinedButton(
                onPressed: () {
                  setState(() {
                    resultat =
                        double.parse(nombre1.text) / double.parse(nombre2.text);
                  });
                },
                child: const Text("/")),
          ],
        ),
        resultat != null ? Text("Le résultat est $resultat") : const Text(""),
      ]),
    );
  }
}
