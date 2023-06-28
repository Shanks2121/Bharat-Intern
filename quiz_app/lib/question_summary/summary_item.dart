import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/question_summary/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.data, {super.key});

  final Map<String, Object> data;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        data['answer'] == data['chosen-answer'];

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIdentifier(
            isCorrectAnswer: isCorrectAnswer,
            questionIndex: data['question-index'] as int ,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data['question'] as String,
                  style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 218, 255, 251),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(data['chosen-answer'] as String,
                    style: const TextStyle(
                      color: Color.fromARGB(150, 218, 255, 251),
                    )),
                Text(data['answer'] as String,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 218, 255, 251),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}