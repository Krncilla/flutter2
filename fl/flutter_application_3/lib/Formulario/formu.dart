import 'package:flutter/material.dart';
import 'dart:math';

class Formulario extends StatefulWidget {
  @override
  _FormularioState createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final guessController = TextEditingController();
  late int secretNumber;
  int attempts = 0;
  String message = "";
  List<int> guesses = [];

  @override
  void initState() {
    super.initState();
    resetGame();
  }

  void resetGame() {
    setState(() {
      secretNumber = Random().nextInt(100) + 1;
      attempts = 0;
      message = "";
      guesses.clear();
      guessController.clear();
    });
  }

  void checkGuess() {
    setState(() {
      int guess = int.parse(guessController.text);
      attempts++;
      guesses.add(guess);

      if (guess == secretNumber) {
        message =
            "¡Correcto! El número era $secretNumber. Adivinaste en $attempts intentos.";
      } else if (guess < secretNumber) {
        message = "Demasiado bajo. Intenta de nuevo.";
      } else {
        message = "Demasiado alto. Intenta de nuevo.";
      }

      if (attempts >= 10 && guess != secretNumber) {
        message =
            "Has alcanzado el límite de intentos. El número era $secretNumber.";
      }

      guessController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Juego de Adivinanza'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://th.bing.com/th/id/OIF.GrHu6bN3k4SLIzYoQ7WOFA?rs=1&pid=ImgDetMain'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Container(
              alignment: Alignment.center,
              child: Image(
                height: 300,
                width: 300,
                image: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoABJxc-C4fvfhbGE3GMtPutDKF8Ker2rkRFWF9hDdX4ISuqjuUON986Ajvq2LRidg_Kg&usqp=CAU'),
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.center,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  children: [
                    TextSpan(text: "¡Hola!\n", style: TextStyle(height: 2.0)),
                    TextSpan(
                        text:
                            "Soy Chaplin, he pensado un número del 1 al 100 y te reto a que adivines en menos de 10 intentos\n",
                        style: TextStyle(height: 2.0)),
                    TextSpan(text: "¡Suerte!\n", style: TextStyle(height: 2.0)),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: TextField(
                controller: guessController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Inserta tu número aquí"),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                          Color.fromARGB(255, 127, 2, 131))),
                 
                  onPressed: checkGuess,
                  child: Text("Adivina"),
                ),
                ElevatedButton(
                   //ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                  onPressed: resetGame,
                  child: Text("Reiniciar"),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                message,
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            if (guesses.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tus conjeturas:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  ...guesses.map((guess) => Text(guess.toString())).toList(),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
