// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:quizz_app_udm/quiz.dart';
import 'package:quizz_app_udm/result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answer': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 7},
        {'text': 'Green', 'score': 5},
        {'text': 'White', 'score': 8}
      ],
    },
    {
      'questionText': 'What\'s your favorite Animal?',
      'answer': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Snake', 'score': 6},
        {'text': 'Lion', 'score': 9},
        {'text': 'Tiger', 'score': 8}
      ],
    },
    {
      'questionText': 'What\'s your favorite food?',
      'answer': [
        {'text': 'Samosa', 'score': 10},
        {'text': 'Pizza', 'score': 6},
        {'text': 'Burger', 'score': 8},
        {'text': 'Pasta', 'score': 9}
      ],
    },
  ];
  //private properties
  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < _questions.length) {
      print('We have more question');
    } else {
      print('No more questions!');
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quizz App'),
      ),
      body: _questionIndex < _questions.length
          ? Quiz(
              questions: _questions,
              answerQuestion: _answerQuestion,
              questionIndex: _questionIndex)
          : Result(
              resultScore: _totalScore,
              resetQuiz: _resetQuiz,
            ),
    );
  }
}
