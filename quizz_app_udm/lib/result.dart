import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetQuiz;
  const Result({Key? key, required this.resultScore, required this.resetQuiz})
      : super(key: key);

  String get resultPhrase {
    var resultText = 'You did it!';
    if (resultScore <= 15) {
      resultText = 'You are awesome and innocent';
    } else if (resultScore <= 20) {
      resultText = 'You are good';
    } else if (resultScore <= 25) {
      resultText = 'You are average';
    } else {
      resultText = 'Better Next Time';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          FlatButton(
              onPressed: resetQuiz,
              textColor: Colors.blue,
              child: Text('Restart Quiz')),
        ],
      ),
    );
  }
}
