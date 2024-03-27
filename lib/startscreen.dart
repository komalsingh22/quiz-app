import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startquiz,{super.key});
  final void Function() startquiz;

  @override
  Widget build(BuildContext context) {

    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
          ),
        ),
        const SizedBox(
          height: 50,
        ),
         Text(
          'Learn the Flutter Fun way!',
          style: GoogleFonts.lato(fontSize: 25, color: Colors.white),
        ),
        const SizedBox(
          height: 30,
        ),
        ElevatedButton.icon(
            onPressed: startquiz,
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz'),),
      ],
    );
  }
}