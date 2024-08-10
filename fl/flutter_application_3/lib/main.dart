import 'package:flutter/material.dart';
import 'Formulario/formu.dart';

void main() {
  runApp(const Inicio());
}

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ejem03",
      debugShowCheckedModeBanner: false,
      home: Formulario(),
    );
  }
}
