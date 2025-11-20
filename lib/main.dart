import 'package:flutter/material.dart';
// Importamos la vista principal de este ejercicio (la pantalla que muestra la lista de países)
import 'View/ViewPaises.dart';

void main() {
  // Punto de entrada de la aplicación.
  // runApp() inicia toda la app de Flutter.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    // MaterialApp es la estructura principal de toda app en Flutter:
    // maneja el tema, navegación, título, etc.
    return MaterialApp(
      title: 'Ejercicio Países',   // Título de la app
      theme: ThemeData(
        primarySwatch: Colors.blue, // Color principal del tema
      ),

      // "home" indica cuál es la primera pantalla que se mostrará al abrir la app.
      // En este caso, nuestra vista principal es ViewPaises.
      home: ViewPaises(),
    );
  }
}