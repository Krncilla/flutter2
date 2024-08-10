import 'dart:ffi';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Caja extends StatelessWidget {
  String numero;
  double ancho;
  Color color;

  Caja(this.numero, this.ancho, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.ancho,
      height: this.ancho,
      color: this.color,
      child: Center(
        child: Text(
          this.numero.toString(),
          style: const TextStyle(fontSize: 30.0),
        ),
      ),
    );
  }
}
