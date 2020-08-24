import 'package:flutter/material.dart';
import 'helpers.dart' as Helpers;

void main() {
  runApp(MyApp());
}

var blocks = List.filled(25, Helpers.individualBlock);
var fruits = Helpers.fruitList
    .map<Widget>((fruit) => Helpers.emojiButton(fruit))
    .toList();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Perfect Match Helper';

    return MaterialApp(
      title: title,
      theme: new ThemeData(scaffoldBackgroundColor: Colors.white),
      home: Column(
        // 5x5 matrix of potential fruit squares.
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.black),
            child: GridView(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                crossAxisCount: 5,
              ),
              children: blocks,
            ),
          ),
          // List of fruits.
          Container(
              decoration: BoxDecoration(color: Colors.white),
              child: GridView(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                    crossAxisCount: 6,
                  ),
                  children: fruits))
        ],
      ),
    );
  }
}
