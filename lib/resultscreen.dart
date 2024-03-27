
import 'package:flutter/material.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/questionsummary/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({required this.chooseAnswer,required this.onRestart,super.key});
  final List<String>chooseAnswer;
  final void Function() onRestart;
  List<Map<String,Object>> getSummaryData(){
    final List<Map<String,Object>> summary=[];
    for(var i=0;i<chooseAnswer.length;i++){
      summary.add({
        'question_index':i,
        'question':questions[i].text,
        'correct_answer':questions[i].answers[0],
        'user_answer':chooseAnswer[i],
      });
    }
    return summary;
  }
  @override
  Widget build(BuildContext context) {
    final summarydata=getSummaryData();
    final totalnumberQuestions=questions.length;
    final totalnumbercorrectanswer= summarydata.where((data){
      return data['user_answer']== data['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text('You answered  $totalnumbercorrectanswer out of $totalnumberQuestions Questions correctly!', style:const  TextStyle(color: Colors.white),),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summarydata),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton.icon(onPressed: onRestart, 
            icon:const  Icon(Icons.restart_alt)
            ,label: const Text('Restart Quiz')),
          ],
        ),
      ),
    );
  }

  
}
