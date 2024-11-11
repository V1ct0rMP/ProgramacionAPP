import 'package:flutter/material.dart';

class Bienvenida extends StatefulWidget {
  final String name;
  const Bienvenida(this.name, {super.key});

  @override
  State<Bienvenida> createState() => _BienvenidaState();
}

class _BienvenidaState extends State<Bienvenida> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 215, 235, 245),
      appBar: AppBar(
        title: const Text("Bienvenida"),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Bienvenido: ${widget.name}',
              style: const TextStyle(
                fontSize: 20,
                fontFamily: "rbold",
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: 180, // Ancho deseado del botón
              height: 60, // Alto deseado del botón
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                label: const Text(
                  "Regresar",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.add_to_home_screen),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
