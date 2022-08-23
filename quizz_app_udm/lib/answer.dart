import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answer;
  const Answer({Key? key, required this.selectHandler, required this.answer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
        textColor: Colors.white,
        color: Colors.blue,
        onPressed: selectHandler,
        child: Text(answer),
      ),
    );
  }
}
