import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  // const Answer({Key? key}) : super(key: key);
  final VoidCallback selectHandler;
  final String answerText;

  Answer(
    this.selectHandler,
    this.answerText,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        // margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
        width: 200,
        height: 50,

        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.blue.shade300),
                foregroundColor: MaterialStateProperty.all(Colors.white)),
            onPressed: selectHandler,
            child: Text(answerText)),
      ),
    );
  }
}
