library helpers;

import 'package:flutter/material.dart';

const fruitList = ['🍎', '🍌', '🍇', '🍊', '🍉', '🍒'];

var individualBlock = Container(
    color: Colors.white,
    child: Material(
        child: Center(child: Text('', style: TextStyle(fontSize: 25)))));

var blocks = List.filled(25, individualBlock);

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedEmoji = '';
  List grid = List.filled(25, '');
  // Blocks should be a function that handle the 25-array to build the individual blocks
  // Onpress gere l'etat de homepage

  void _changeSelectedEmoji(emoji) {
    setState(() {
      selectedEmoji = emoji;
    });
  }

  emojiButton(fruitEmoji) {
    return FlatButton(
      color: Colors.white,
      textColor: Colors.black,
      disabledColor: Colors.white,
      disabledTextColor: Colors.black,
      padding: EdgeInsets.all(8.0),
      splashColor: Colors.blueAccent,
      onPressed: () {
        print(fruitEmoji);
        _changeSelectedEmoji(fruitEmoji);
      },
      child: Text(fruitEmoji, style: TextStyle(fontSize: 35)),
    );
  }

  @override
  Widget build(BuildContext context) {
    var fruits = fruitList.map<Widget>((fruit) => emojiButton(fruit)).toList();
    return new Column(
      children: <Widget>[
        // 5x5 matrix of potential fruit squares.
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
                children: fruits)),
        // Selected fruit display.
        Material(
            color: Colors.white,
            child: Center(
                child: Text(this.selectedEmoji, style: TextStyle(fontSize: 60)),
            ),
        ),
        // Fill to the bottom.
        Expanded(
            child: Container(color: Colors.white)
        ),
      ],
    );
  }
}
