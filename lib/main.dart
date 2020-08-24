import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

var individualBlock = Container(color: Colors.white);
var blocks = List.filled(25, individualBlock);

// Fruits definition.
var fruitList = ['🍎', '🍌', '🍇', '🍊', '🍉', '🍒'];
emojiButton(fruitEmoji) {
  return FlatButton(
    color: Colors.white,
    textColor: Colors.black,
    disabledColor: Colors.grey,
    disabledTextColor: Colors.black,
    padding: EdgeInsets.all(8.0),
    splashColor: Colors.blueAccent,
    onPressed: () {
      print(fruitEmoji);
    },
    child: Text(
      fruitEmoji,
      style: TextStyle(fontSize: 5)
    ),
  );
}

var fruits = fruitList.map<Widget>((fruit) => emojiButton(fruit)).toList();
var fruitListWorking = fruitList.map<Widget>((fruit) => Text(fruit)).toList();

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
