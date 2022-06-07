import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './result.dart';
import './quiz.dart';
// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color ?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ],
    },
    {
      'questionText': 'What\'s your favorite animal ?',
      'answers': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Snake', 'score': 5},
        {'text': 'Elephant', 'score': 3},
        {'text': 'Lion', 'score': 1},
      ],
    },
    {
      'questionText': 'Who\'s your favorite instructor ?',
      'answers': [
        {'text': 'Max', 'score': 10},
        {'text': 'Angela', 'score': 5},
        {'text': 'Brad', 'score': 3},
        {'text': 'Colt', 'score': 1},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _exitQuiz() {
    setState(() {
      SystemNavigator.pop();
      exit(0);
    });
  }

  void _answerQuestion(int score) {
    // var aBool = true;
    // aBool = false;
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
    // print('Answer $number chosen!');
  }

  @override
  Widget build(BuildContext context) {
    // questions.add({
    //   'questionText':'How old are you ?',
    //   'answers':['20','21','22','25']
    // });
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text('Quiz App'),
            backgroundColor: Colors.blue.shade300),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(
                resultScore: _totalScore,
                resetQuiz: _resetQuiz,
                exitQuiz: _exitQuiz,
              ),
      ),
    );
  }
}
