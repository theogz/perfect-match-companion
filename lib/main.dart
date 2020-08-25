import 'package:flutter/material.dart';
import 'helpers.dart' as Helpers;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Perfect Match Helper';

    return MaterialApp(
      title: title,
      theme: new ThemeData(scaffoldBackgroundColor: Colors.white),
      home: new Helpers.HomePage()
    );
  }
}
