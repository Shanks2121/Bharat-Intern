import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.onTap, required this.answer});

  final void Function() onTap;
  final String answer;

  @override
  Widget build(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
                foregroundColor: Color.fromARGB(255, 33, 51, 99),
                backgroundColor:const Color.fromARGB(255, 0, 28, 48),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))
            ),
            child: Text(answer,
              style: const TextStyle(
                color: Color.fromARGB(255, 218, 255, 251),
                fontSize: 16,
                fontWeight: FontWeight.w500
              ),
            )
        ),
        const SizedBox(height: 8)
      ],
    );
  }
}
