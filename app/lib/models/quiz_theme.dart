class QuizTheme {
  final String name;
  final String description;

  QuizTheme({required this.name, required this.description});

  // Convertit un Map en une instance de QuizTheme
  factory QuizTheme.fromMap(Map<String, dynamic> map) {
    return QuizTheme(
      name: map['name'],
      description: map['description'],
    );
  }

  // Convertit une instance de QuizTheme en un Map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
    };
  }

  static fromJson(Map<String, dynamic> item) {
    return QuizTheme(
      name: item['name'],
      description: item['description'],
    );
  }
}
