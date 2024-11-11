import 'package:flutter/material.dart';
import 'package:multipantalla/bienvenida.dart';

// Metodo main
void main() {
  runApp(const Primera());
}

class Primera extends StatelessWidget {
  const Primera({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Multiformularios",
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const Pantalla(),
    );
  }
}

class Pantalla extends StatefulWidget {
  const Pantalla({super.key});

  @override
  State<Pantalla> createState() => _PantallaState();
}

class _PantallaState extends State<Pantalla> {
  var txtLogin = TextEditingController();
  var txtPassword = TextEditingController();
  var nombre = "";
  var clave = "";

  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("img/fondo.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text(
            "Multiformularios",
            style: TextStyle(fontFamily: 'Arial', fontSize: 24),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 100, horizontal: 20),
              alignment: Alignment.center,
              child: Image.asset("img/logo.png"),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              alignment: Alignment.center,
              child: TextField(
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: "Nombre de Usuario",
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                controller: txtLogin,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              alignment: Alignment.center,
              child: TextField(
                textAlign: TextAlign.center,
                obscureText: !isPasswordVisible,
                decoration: InputDecoration(
                  hintText: "Clave Usuario",
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                    icon: Icon(
                      isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                ),
                controller: txtPassword,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(25),
              alignment: Alignment.center,
              child: ElevatedButton.icon(
                onPressed: () {
                  nombre = txtLogin.text;
                  clave = txtPassword.text;

                  if (nombre == 'pelochas' && clave == '1234') {
                    Navigator.of(context).push(
                      MaterialPageRoute<Null>(builder: (BuildContext context) {
                        return Bienvenida(nombre);
                      }),
                    );
                  } else {
                    _showDialog(context, false); // Muestra diálogo de error
                  }
                },
                label: const Text("Validar"),
                icon: const Icon(Icons.login),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Función para mostrar el diálogo con íconos de usuario válido o inválido
  void _showDialog(BuildContext context, bool isValidUser) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(
                isValidUser ? Icons.check_circle : Icons.error, // Icono de acuerdo al estado
                color: isValidUser ? Colors.green : Colors.red,
              ),
              const SizedBox(width: 10),
              Text(
                isValidUser ? "Usuario Válido" : "Error",
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 24,
                  color: isValidUser ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),
          content: const SingleChildScrollView(
            child: ListBody(
              children: [
                Text(
                  "Verifica tus Credenciales",
                  style: TextStyle(fontFamily: 'Arial', fontSize: 20, color: Colors.red),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Aceptar"),
            ),
          ],
        );
      },
    );
  }
}
