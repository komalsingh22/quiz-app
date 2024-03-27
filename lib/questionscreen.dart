import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/question.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({required this.onselectedAnswer,super.key});

  final void Function(String answer) onselectedAnswer;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex=0;
  void answerQuestion(String selectedanswer){
    widget.onselectedAnswer(selectedanswer);
    setState(() {
      currentQuestionIndex++;
    });
  }
  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      
      child: Container(
       
        margin:const  EdgeInsets.all(20),
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
               color: Colors.white,
               fontSize: 24,
               fontWeight:FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 15,
            ),
            ...currentQuestion.getShufffledAnswer().map((answer){
              return AnswerButton(answer:answer , onTap: (){
                answerQuestion(answer);
              });
            }),
           
          ],
        ),
      ),
    );
  }
}
