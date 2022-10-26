import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobrbb/screens/components/rounded_button.dart';
import 'package:mobrbb/screens/dice_screen.dart';
import 'package:mobrbb/screens/movies_screen.dart';
import 'package:mobrbb/screens/personal_card_screen.dart';
import 'package:mobrbb/screens/quiz_screen.dart';

class MenuScreen extends StatelessWidget {
  static const String id = 'menu_screen';

  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Menu inicial',
                style: GoogleFonts.pacifico(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: double.infinity,
                height: 32,
              ),
              RoundedButton(
                text: 'Cartão pessoal',
                onPressed: () {
                  Navigator.pushNamed(context, PersonalCardScreen.id,
                      arguments: PersonalCardScreenArguments(
                        phone: '11 123456789',
                        email: 'teste@testinho.com',
                      ));
                },
              ),
              const SizedBox(height: 16),
              RoundedButton(
                text: 'Dado',
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    DiceScreen.id,
                  );
                },
              ),
              const SizedBox(height: 16),
              RoundedButton(
                text: 'Quiz',
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    QuizScreen.id,
                  );
                },
              ),
              const SizedBox(height: 16),
              RoundedButton(
                text: 'Lista de filmes',
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    MoviesScreen.id,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
