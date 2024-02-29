import 'package:flutter/material.dart';
import './screens/quiz_themes_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark, // Cela rend votre thème sombre
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFF003B46), // Bleu pétrole
        colorScheme: const ColorScheme.dark(
          secondary: Colors.orange, // Utilisé à la place de accentColor
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Colors.orange, // Couleur des boutons
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: const QuizThemesPage(),
    );
  }
}
