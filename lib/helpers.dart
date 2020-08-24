library helpers;
import 'package:flutter/material.dart';

const fruitList = ['🍎', '🍌', '🍇', '🍊', '🍉', '🍒'];

var individualBlock = Container(
    color: Colors.white,
    child: Material(
        child: Center(child: Text('', style: TextStyle(fontSize: 25)))
    )
);

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
      style: TextStyle(fontSize: 35)
    ),
  );
}
