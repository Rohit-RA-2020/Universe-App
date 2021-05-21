import 'package:flutter/material.dart';
import 'package:universe/home.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Universe in hand',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: Home(),
    );
  }
}
