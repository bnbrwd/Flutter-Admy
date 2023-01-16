import 'package:flutter/material.dart';
import 'package:widgets_days_collection/home_page.dart';
import 'package:widgets_days_collection/html_call.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widgets of days',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: HtmlCall(),
    );
  }
}
