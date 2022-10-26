import 'package:flutter/material.dart';
import 'package:mobrbb/models/question_model.dart';
import 'package:mobrbb/screens/components/rounded_button.dart';
import 'package:mobrbb/screens/quiz_complete_screen.dart';

class QuizScreen extends StatefulWidget {
  static const String id = 'quiz';

  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  var questionIndex = 0;
  var userScore = 0;
  var questionsList = <QuestionModel>[];

  @override
  void initState() {
    super.initState();
    questionsList = loadQuestions();
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questionsList[questionIndex];
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                currentQuestion.question,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ListView.separated(
                shrinkWrap: true,
                itemCount: currentQuestion.options.length,
                itemBuilder: (_, index) => RoundedButton(
                  onPressed: () {
                    onOptionPressed(index);
                  },
                  text: currentQuestion.options[index],
                ),
                separatorBuilder: (_, __) => const SizedBox(height: 8),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onOptionPressed(int index) {
    final currentQuestion = questionsList[questionIndex];
    if (currentQuestion.answer == index) {
      userScore++;
    }
    goToNextQuestion();
  }

  void goToNextQuestion() {
    if (questionIndex >= questionsList.length - 1) {
      Navigator.pushReplacementNamed(
        context,
        QuizCompleteScreen.id,
        arguments: QuizCompleteArguments(
          score: userScore,
          totalQuestions: questionsList.length,
        ),
      );
    } else {
      setState(() {
        questionIndex++;
      });
    }
  }

  List<QuestionModel> loadQuestions() {
    return [
      const QuestionModel(
          question: 'Qual é o país que mais produz café no mundo?',
          options: ['Canadá', 'Índia', 'Argentina', 'Brasil', 'Etiópia'],
          answer: 3),
      const QuestionModel(
          question: 'País conhecido por ser o mais fechado do mundo',
          options: ['Myanmar', 'Coréia do Norte', 'Armênia', 'Iêmen', 'Vietnã'],
          answer: 1),
      const QuestionModel(
          question: 'País que possui a Groelândia como território',
          options: [
            'Finlândia',
            'Canadá',
            'Reino Unido',
            'Estados Unidos',
            'Dinamarca'
          ],
          answer: 4),
      const QuestionModel(
          question: 'País com a maior média de qi',
          options: ['China', 'Alemanha', 'Japão', 'Coréia do Sul', 'Noruega'],
          answer: 3),
      const QuestionModel(
          question: 'País com maior IDH (índice de desenvolvimento humano)',
          options: ['Noruega', 'Reino Unido', 'Canadá', 'Holanda', 'México'],
          answer: 0),
      const QuestionModel(
          question: 'Continente menos industrializado',
          options: ['África', 'Ásia', 'Oceania'],
          answer: 0),
      const QuestionModel(
          question: 'País com maior comunidade japonesa fora do Japão',
          options: ['Estados Unidos', 'Brasil', 'Coréia do Sul'],
          answer: 1),
    ];
  }
}
