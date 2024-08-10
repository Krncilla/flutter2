import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Calculadora extends StatefulWidget {
  final String usuario;
  final double saldoActual;

  const Calculadora({Key? key, required this.usuario, this.saldoActual = 0.0})
      : super(key: key);

  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  final TextEditingController _recargaController = TextEditingController();
  final TextEditingController _minuto1Controller =
      TextEditingController(text: "00");
  final TextEditingController _minuto2Controller =
      TextEditingController(text: "00");
  final TextEditingController _minuto11Controller =
      TextEditingController(text: "00");

  double _saldo = 0.0;
  int _minutos = 0;

  @override
  void initState() {
    super.initState();
    _saldo = widget.saldoActual;
  }

  void _recargar() {
    final double recarga = double.tryParse(_recargaController.text) ?? 0.0;
    final double minuto1 = double.tryParse(_minuto1Controller.text) ?? 90.0;
    final double minuto2 = double.tryParse(_minuto2Controller.text) ?? 80.0;
    final double minuto11 = double.tryParse(_minuto11Controller.text) ?? 50.0;

    _saldo += recarga;
    _minutos = 0;

    if (_saldo < minuto1) {
      setState(() {
        _minutos = 0;
      });
    } else {
      _saldo -= minuto1;
      _minutos = 1;

      for (int i = 2; i <= 10 && _saldo >= minuto2; i++) {
        _saldo -= minuto2;
        _minutos++;
      }

      while (_saldo >= minuto11) {
        _saldo -= minuto11;
        _minutos++;
      }

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 41, 3, 0),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context, _saldo);
          },
        ),
      ),
      body: contenidoCalculadora(),
    );
  }

  Widget contenidoCalculadora() {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: NetworkImage('lib/img/fondo2.png'),
        fit: BoxFit.fill,
      )),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Saldo Actual: \$$_saldo",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
              height: 20), 
          saldo(),
          SizedBox(height: 20),
          minuto1(),
          SizedBox(height: 20), 
          minuto2(),
          SizedBox(height: 20), 
          minuto11(),
          SizedBox(height: 20), 
          botonRecargar(),
          if (_minutos > 0)
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                "Minutos: $_minutos\nSaldo Restante: \$$_saldo",
                style: const TextStyle(
                    fontSize: 20, color: Color.fromARGB(255, 180, 110, 238)),
                textAlign: TextAlign.center,
              ),
            ),
          if (_saldo < double.parse(_minuto1Controller.text) && _minutos == 0)
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: const Text(
                "Saldo insuficiente",
                style: TextStyle(fontSize: 20, color: Colors.red),
                textAlign: TextAlign.center,
              ),
            ),
        ],
      ),
    );
  }

  Widget saldo() {
    return TextField(
      controller: _recargaController,
      decoration: const InputDecoration(
        labelText: "Valor a recargar",
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
    );
  }

  Widget minuto1() {
    return TextField(
      controller: _minuto1Controller,
      decoration: const InputDecoration(
        labelText: "Costo del Minuto 1",
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
    );
  }

  Widget minuto2() {
    return TextField(
      controller: _minuto2Controller,
      decoration: const InputDecoration(
        labelText: "Costo de Minuto 2 al 10",
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
    );
  }

  Widget minuto11() {
    return TextField(
      controller: _minuto11Controller,
      decoration: const InputDecoration(
        labelText: "Costo de Minuto 11 en adelante",
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
    );
  }

  Widget botonRecargar() {
    return ElevatedButton(
      onPressed: _recargar,
      child: const Text("Recargar"),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 212, 11, 125),
      ),
    );
  }
}
