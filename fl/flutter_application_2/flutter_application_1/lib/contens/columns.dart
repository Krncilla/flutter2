import 'package:flutter/material.dart';
import 'package:flutter_application_1/contens/caja.dart';

class EjeColum extends StatelessWidget {
  const EjeColum({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      verticalDirection: VerticalDirection.up,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Caja(1, 100.0, Colors.red),
        Caja(2, 50.0, Colors.green),
        Caja(3, 200.0, Color.fromARGB(255, 6, 46, 78)),
        Caja(4, 100.0, Color.fromARGB(255, 218, 197, 14))
      ],
    );
  }
}
