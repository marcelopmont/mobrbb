// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class PersonalCardScreen extends StatelessWidget {
  static const String id = 'personal_card';

  const PersonalCardScreen({
    super.key,
    required this.arguments,
  });

  final PersonalCardScreenArguments arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cartão pessoal'),
      ),
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://pbs.twimg.com/media/FKNlhKZUcAEd7FY?format=jpg&name=4096x4096'),
                radius: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Flutter is awesome',
                  style: GoogleFonts.pacifico(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Material(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10000)),
                elevation: 4,
                child: ListTile(
                  onTap: () {
                    launchUrl(
                      Uri(
                        scheme: 'tel',
                        path: arguments.phone,
                      ),
                    );
                  },
                  leading: Icon(
                    Icons.phone_android,
                    color: Colors.teal,
                  ),
                  title: Text(
                    arguments.phone,
                    style: TextStyle(
                      color: Colors.teal,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Material(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10000)),
                elevation: 4,
                child: ListTile(
                  onTap: () {
                    launchUrl(
                      Uri(
                        scheme: 'mailto',
                        path: arguments.email,
                        query: 'subject=Email Teste',
                      ),
                    );
                  },
                  leading: Icon(
                    Icons.email,
                    color: Colors.teal,
                  ),
                  title: Text(
                    arguments.email,
                    style: TextStyle(
                      color: Colors.teal,
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

class PersonalCardScreenArguments {
  PersonalCardScreenArguments({
    required this.phone,
    this.email = '',
  });

  String phone;
  String email;
}
