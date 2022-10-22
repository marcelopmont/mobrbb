// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobrbb/screens/personal_card_screen.dart';

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
              SizedBox(
                width: double.infinity,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, PersonalCardScreen.id,
                        arguments: PersonalCardScreenArguments(
                          phone: '11 123456789',
                          email: 'teste@testinho.com',
                        ));
                  },
                  child: Material(
                    borderRadius: BorderRadius.all(Radius.circular(1000)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      child: Center(
                        child: Text(
                          'Cartão pessoal',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
