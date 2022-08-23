import 'package:flutter/material.dart';
import 'package:quizz_app_udm/answer.dart';
import 'package:quizz_app_udm/question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answerQuestion;
  final int questionIndex;
  const Quiz(
      {Key? key,
      required this.questions,
      required this.answerQuestion,
      required this.questionIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questionText: questions[questionIndex]['questionText'] as String,
        ),

        //here ... take a list which is exactly  what we have here and they pull all
        //all the value in the list out of it and add them to the surrounding list as individual values
        // ...(questions[questionIndex]['answer'] as List<String>).map((ans) {
        //   return Answer(selectHandler: answerQuestion, answer: ans);
        // }).toList()

        ...(questions[questionIndex]['answer'] as List<Map<String, Object>>)
            .map((ans) {
          return Answer(
              selectHandler: () => answerQuestion(ans['score']),
              answer: ans['text'] as String);
        }).toList()
      ],
    );
  }
}
