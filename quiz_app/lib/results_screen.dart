import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/question_summary/question_summary.dart';

import 'data/questions.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key,
    required this.chosenAnswers,
    required this.onRestart
  });

  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummary(){
      final List<Map<String, Object>> summary = [];

      for(var i = 0; i< chosenAnswers.length ; i++){
        summary.add({
          'question-index' : i,
          'question' : questions[i].text,
          'answer' : questions[i].answer[0],
          'chosen-answer' : chosenAnswers[i]
        });
      }
      return summary;
  }


  @override
  Widget build(BuildContext context) {
    final summaryData = getSummary();
    final totalQuestions = questions.length;
    final correctAns = summaryData.where((data){
      return data['answer'] == data['chosen-answer'];
    }).length;



    return SizedBox(
      width: double.infinity,
      child: Container(
        margin:const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:  [
            Text("You Answered $correctAns out of $totalQuestions Questions Correctly",
                textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 225, 236, 200),
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 30),
            QuestionSummary(getSummary()),
            const SizedBox(height: 40,),
          TextButton.icon(
            onPressed: onRestart,
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.refresh),
            label:  Text('Restart Quiz!',
              style: GoogleFonts.lato(
                fontWeight: FontWeight.w400,
                color: const Color.fromARGB(255, 225, 236, 200),
                fontSize: 20
              ),
            ),
          )
          ],
        ),
      ),
    );
  }
}
