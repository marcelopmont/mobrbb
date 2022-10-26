import 'package:flutter/material.dart';

class QuizCompleteScreen extends StatelessWidget {
  static const String id = 'quiz_complete';

  const QuizCompleteScreen({
    super.key,
    required this.arguments,
  });

  final QuizCompleteArguments arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Text(
              'Parabéns, sua pontuação foi de ${arguments.score}/${arguments.totalQuestions}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

class QuizCompleteArguments {
  QuizCompleteArguments({
    required this.score,
    required this.totalQuestions,
  });

  final int score;
  final int totalQuestions;
}
