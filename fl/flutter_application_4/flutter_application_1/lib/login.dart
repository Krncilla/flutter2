import 'package:flutter/material.dart';
import 'calculadora.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool _mostrarMensaje = false;
  double _saldo = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: contenido(),
    );
  }

  Widget contenido() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('lib/img/fondo.jpg'),
          fit: BoxFit.fill,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            saludo(),
            usuario(),
            pass(),
            botoningreso(),
            if (_mostrarMensaje) Ingreso(),
          ],
        ),
      ),
    );
  }

  Widget saludo() {
    return const Text(
      "Bienvenida",
      style: TextStyle(
        color: Color.fromARGB(255, 98, 5, 221),
        fontSize: 50,
        fontWeight: FontWeight.bold,
        fontFamily: 'Roboto',
      ),
    );
  }

  Widget usuario() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: TextField(
        controller: _usuarioController,
        decoration: InputDecoration(
          hintText: "Usuario",
          fillColor: Color.fromARGB(255, 205, 177, 236),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }

  Widget pass() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: TextField(
        controller: _passController,
        obscureText: true,
        decoration: InputDecoration(
          hintText: "Contraseña",
          fillColor: Color.fromARGB(255, 205, 177, 236),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }

  Widget botoningreso() {
    return SizedBox(
      width: 200,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          if (_usuarioController.text.isNotEmpty &&
              _passController.text.isNotEmpty) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Calculadora(
                    usuario: _usuarioController.text, saldoActual: _saldo),
              ),
            ).then((nuevoSaldo) {
              if (nuevoSaldo != null) {
                setState(() {
                  _saldo = nuevoSaldo;
                });
              }
            });
          } else {
            setState(() {
              _mostrarMensaje = true;
            });
          }
        },
        child: const Text(
          'Ingreso',
          style: TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 232, 12, 240),
        ),
      ),
    );
  }

  Widget Ingreso() {
    return const Text(
      "Ingresando",
      style: TextStyle(
        color: Color.fromARGB(255, 101, 69, 245),
        fontSize: 50,
        fontWeight: FontWeight.bold,
        fontFamily: 'Roboto',
      ),
    );
  }
}
