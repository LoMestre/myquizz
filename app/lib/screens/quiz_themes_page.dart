import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_quizz/models/quiz_theme.dart';
import 'dart:convert';
import 'package:my_quizz/services/theme_service.dart';

class QuizThemesPage extends StatefulWidget {
  const QuizThemesPage({super.key});

  @override
  State<QuizThemesPage> createState() => _QuizThemesPageState();
}

class _QuizThemesPageState extends State<QuizThemesPage> {
  List<QuizTheme> quizThemes = [];

  @override
  void initState() {
    super.initState();
    fetchQuizThemes();
  }

  fetchQuizThemes() async {
    ThemeService themeService = ThemeService('http://localhost:3000');
    try {
      List<QuizTheme> themes = await themeService.getThemes();
      setState(() {
        quizThemes = themes;
      });
    } catch (e) {
      throw Exception('Failed to load themes');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Themes'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          TextEditingController themeController = TextEditingController();
          TextEditingController descriptionController = TextEditingController();
          showDialog(
            context: context,
            builder: (BuildContext dialogContext) {
              return AlertDialog(
                title: const Text('Add a new theme'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextField(
                      controller: themeController,
                      decoration: const InputDecoration(hintText: "Theme name"),
                    ),
                    TextField(
                      controller: descriptionController,
                      decoration:
                          const InputDecoration(hintText: "Description"),
                    ),
                  ],
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text('CANCEL'),
                    onPressed: () {
                      Navigator.of(dialogContext).pop();
                    },
                  ),
                  TextButton(
                    child: const Text('ADD'),
                    onPressed: () async {
                      String themeName = themeController.text;
                      String description = descriptionController.text;
                      ThemeService themeService =
                          ThemeService('http://localhost:3000');
                      List<QuizTheme> themes =
                          await themeService.addTheme(themeName, description);
                      setState(() {
                        quizThemes = themes;
                      });
                      // ignore: use_build_context_synchronously
                      Navigator.of(dialogContext).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: quizThemes.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              child: ListTile(
                title: Text(quizThemes[index].name),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.more_vert),
                      onPressed: () {
                        // Code pour plus d'actions
                      },
                    ),
                  ],
                ),
                onTap: () {
                  // Code pour lancer le quiz
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
