import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  // const Result({Key? key}) : super(key: key);
  final int? resultScore;
  final VoidCallback? resetQuiz;
  final VoidCallback? exitQuiz;

  Result({this.resultScore, this.resetQuiz,this.exitQuiz});

  String get resultPhrase {
    String resultText;
    if (resultScore! <= 8) {
      resultText = 'You are awesome and innocent';
    } else if (resultScore! <= 12) {
      resultText = 'Pretty likeable';
    } else if (resultScore! <= 16) {
      resultText = 'You are Strange';
    } else {
      resultText = 'You are so bad';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text('Your score is: \n'),
            Text(resultScore.toString()),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                resultPhrase,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            TextButton(onPressed: resetQuiz, child: Text('Restart Quiz')),
            TextButton(onPressed: exitQuiz, child: Text('Exit'))
          ],
        ),
      ),
    );
  }
}
