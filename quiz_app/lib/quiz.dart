import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

import 'data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  String? activeState;
  List<String> selectedAnswer = [];

  void switchScreen() {
    setState(() {
      activeState = 'question-screen';
    });
  }

  void chooseAnswer(String answer){
    selectedAnswer.add(answer);

    if(selectedAnswer.length == questions.length){
      setState(() {
        activeState = 'results-screen';
      });
    }
  }

  void onRestart(){
    selectedAnswer = [];
    setState(() {
      activeState = 'question-screen';
    });
  }

  @override
  Widget build(context) {
  // activeState == 'start-screen'
  // ? StartScreen(switchScreen)
  //     : const QuestionScreen()

    Widget setScreen = StartScreen(switchScreen);

    if(activeState == 'question-screen'){
      setScreen =  QuestionScreen(onSelectAnswer: chooseAnswer);
  }

    if(activeState == 'results-screen'){
      setScreen =  ResultsScreen(chosenAnswers: selectedAnswer, onRestart: onRestart,);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromARGB(255, 0, 28, 48),
              Color.fromARGB(255, 23, 107, 135)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            child: setScreen),
      ),
    );
  }
}
