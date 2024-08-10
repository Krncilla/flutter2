import 'package:flutter/material.dart';
import 'package:flutter_application_1/contens/columns.dart';

void main() {
  runApp(const Inicio());
}

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ejer_03",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          color: Color.fromARGB(66, 2, 0, 0),
          child: EjeColum(),
        ),
      ),
    );
  }
}
