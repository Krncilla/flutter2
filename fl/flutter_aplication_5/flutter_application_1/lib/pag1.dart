import 'package:flutter/material.dart';

class Pag1 extends StatefulWidget {
  const Pag1({super.key});

  @override
  State<Pag1> createState() => _Pag1State();
}

class _Pag1State extends State<Pag1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Pagina 1"),
        ),
      ),
      body: Contenido(),
    );
  }
}

Widget Contenido() {
  return Expanded(
    child: Column(
      children: <Widget>[
        Expanded(
          child: Container(
            color: const Color.fromARGB(255, 246, 235, 137),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Distribuidor Columnas"),
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  color: Colors.red,
                  child: Center(child: const Text("color Rojo")),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.yellow,
                  child: Center(child: const Text("color Amarillo")),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  color: Colors.blue,
                  child: Center(child: const Text("color Azul")),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.green,
                  child: Center(child: const Text("color verde")),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            color: const Color.fromARGB(255, 246, 235, 137),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Distribuidor Columnas"),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
