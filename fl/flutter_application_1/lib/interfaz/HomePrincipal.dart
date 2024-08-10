import 'package:flutter/material.dart';

class HomePrincipal extends StatefulWidget {
  const HomePrincipal({super.key});

  @override
  State<HomePrincipal> createState() => _HomePrincipalState();
}

class _HomePrincipalState extends State<HomePrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text("Datos",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 221, 10, 151))),
        ),
        backgroundColor: Color.fromARGB(255, 97, 2, 134),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Color.fromARGB(255, 182, 112, 194),
          child: ListView(
            children: [
              Image(
                  image: NetworkImage(
                      'https://th.bing.com/th/id/OIP.wJRsxbkTbvTqLiatVYRe_AAAAA?rs=1&pid=ImgDetMain')),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text('texto 1'),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text('texto 2'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 252, 251, 251),
                  radius: 100,
                  child: const CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://cdn.pixabay.com/photo/2016/05/31/11/43/backwards-1426683_1280.png'),
                    radius: 90,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
