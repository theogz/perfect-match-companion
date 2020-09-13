library homepage;

import 'package:flutter/material.dart';

const fruitList = ['🍎', '🍌', '🍇', '🍊', '🍉', '🍒'];
const emptyFruit = '';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Selected emoji in the menu.
  String selectedEmoji = emptyFruit;

  // Selected tile index in the matrix.
  int selectedTileIndex;

  // Matrix of fruits.
  List fruitMatrix = List.filled(16, emptyFruit);

  void _changeSelectedEmoji(emoji) {
    setState(() {
      selectedEmoji = emoji;
    });
  }

  void _changeSelectedTile(value) {
    setState(() {
      selectedTileIndex = value;
    });
  }

  void _updateEmojiInMatrix(emoji, pos) {
    setState(() {
      fruitMatrix[pos] = emoji;
    });
  }

  bool _isTileEmpty(pos) {
    return fruitMatrix[pos] == emptyFruit;
  }

  bool _isSameFruit(fruit, pos) {
    return fruitMatrix[pos] == fruit;
  }

  bool isTileSelected(pos) {
    return selectedTileIndex == pos;
  }

  bool hasTileSelected() {
    return selectedTileIndex != null;
  }

  void _clearArray() {
    setState(() {
      fruitMatrix = List.filled(16, emptyFruit);
    });
  }

  generateGrid(tilesArray) {
    return tilesArray
        .asMap()
        .entries
        .map<Widget>(
          (entry) => new GestureDetector(
            onTap: () {
              int pos = entry.key;

              // Fruit is selected in menu: apply in grid
              if (selectedEmoji != '') {
                String newValue = _isSameFruit(this.selectedEmoji, pos)
                    ? emptyFruit
                    : this.selectedEmoji;
                _updateEmojiInMatrix(newValue, pos);
                return _changeSelectedEmoji('');
              }

              // No fruit selected: remove if there is one in grid.
              if (!_isTileEmpty(pos)) {
                return _updateEmojiInMatrix('', pos);
              }

              // No Fruit, no selection: highlight grid item.
              bool isSelected = isTileSelected(pos);
              _changeSelectedTile((isSelected) ? null : pos);
            },
            child: Container(
              child: Material(
                color: isTileSelected(entry.key) ? Colors.amber : Colors.white,
                child: Center(
                    child: Text(entry.value, style: TextStyle(fontSize: 50))),
              ),
            ),
          ),
        )
        .toList();
  }

  makeEmojiMenuButton(emoji) {
    return FlatButton(
      color: Colors.white,
      textColor: Colors.black,
      disabledColor: Colors.white,
      disabledTextColor: Colors.black,
      padding: EdgeInsets.all(8.0),
      splashColor: Colors.blueAccent,
      onPressed: () {
        // if there is a tile selected, fill with current fruit.
        if (hasTileSelected()) {
          _updateEmojiInMatrix(emoji, this.selectedTileIndex);
          _changeSelectedTile(null);
          return;
        }

        // Update fruit below menu.
        _changeSelectedEmoji(emoji);
      },
      child: Text(emoji, style: TextStyle(fontSize: 35)),
    );
  }

  @override
  Widget build(BuildContext context) {
    var tiles = generateGrid(fruitMatrix);
    var fruitButtons =
        fruitList.map<Widget>((fruit) => makeEmojiMenuButton(fruit)).toList();
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
                children: fruitButtons)),
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
