library homepage;

import 'package:flutter/material.dart';

const fruitList = ['🍎', '🍌', '🍇', '🍊', '🍉', '🍒'];

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedEmoji = '';
  List grid = List.filled(16, '');

  void _changeSelectedEmoji(emoji) {
    setState(() {
      selectedEmoji = emoji;
    });
  }

  void _updateArray(emoji, pos) {
    setState(() {
      grid[pos] = emoji;
    });
  }

  void _clearArray() {
    setState(() {
      grid = List.filled(16, '');
    });
  }

  generateGrid(tilesArray) {
    return tilesArray
        .asMap()
        .entries
        .map<Widget>(
          (entry) => new GestureDetector(
            onTap: () {
              _updateArray(this.selectedEmoji, entry.key);
              return _changeSelectedEmoji('');
            },
            child: Container(
              color: Colors.white,
              child: Material(
                child: Center(
                    child: Text(entry.value, style: TextStyle(fontSize: 50))),
              ),
            ),
          ),
        )
        .toList();
  }

  selectEmoji(emoji) {
    return FlatButton(
      color: Colors.white,
      textColor: Colors.black,
      disabledColor: Colors.white,
      disabledTextColor: Colors.black,
      padding: EdgeInsets.all(8.0),
      splashColor: Colors.blueAccent,
      onPressed: () {
        print(emoji);
        _changeSelectedEmoji(emoji);
      },
      child: Text(emoji, style: TextStyle(fontSize: 35)),
    );
  }

  @override
  Widget build(BuildContext context) {
    var tiles = generateGrid(grid);
    var fruits = fruitList.map<Widget>((fruit) => selectEmoji(fruit)).toList();
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
              crossAxisCount: 4,
            ),
            children: tiles,
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
            child: Text(this.selectedEmoji, style: TextStyle(fontSize: 50)),
          ),
        ),
        // Reset grid functionality.
        ConstrainedBox(
          constraints: BoxConstraints(minWidth: 500, minHeight: 160),
          child: Container(
            color: Colors.white,
            child: FlatButton(
              color: Colors.white,
              child: Text('RESET GRID', style: TextStyle(color: Colors.black)),
              onPressed: () => _clearArray(),
            ),
          ),
        ),
        // Fill the rest up until the bottom of the screen.
        Expanded(child: Container(color: Colors.white)),
      ],
    );
  }
}
