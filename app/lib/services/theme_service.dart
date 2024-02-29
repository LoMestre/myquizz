import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:my_quizz/models/quiz_theme.dart';

class ThemeService {
  final String baseUrl;

  ThemeService(this.baseUrl);

  Future<List<QuizTheme>> getThemes() async {
    final response = await http.get(Uri.parse('$baseUrl/themes'));

    if (response.statusCode == 200) {
      var list = List<Map<String, dynamic>>.from(json.decode(response.body));
      return list.map((item) => QuizTheme.fromMap(item)).toList();
    } else {
      throw Exception('Failed to load themes');
    }
  }

  Future<List<QuizTheme>> addTheme(String themeName, String description) async {
    final response = await http.post(
      Uri.parse('$baseUrl/themes'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': themeName,
        'description': description,
      }),
    );

    if (response.statusCode == 201) {
      return getThemes();
    } else {
      throw Exception('Failed to add theme');
    }
  }
}
