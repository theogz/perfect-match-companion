library helpers;
import 'package:flutter/material.dart';

const fruitList = ['🍎', '🍌', '🍇', '🍊', '🍉', '🍒'];

var individualBlock = Container(
    color: Colors.white,
    child: Material(
        child: Center(child: Text('', style: TextStyle(fontSize: 25)))
    )
);

var blocks = List.filled(25, individualBlock);


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

    String selectedEmoji;

    void _changeSelectedEmoji(emoji) {
        setState(() {
          selectedEmoji = emoji;
        });
    }

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
                _changeSelectedEmoji(fruitEmoji);
            },
            child: Text(
            fruitEmoji,
            style: TextStyle(fontSize: 35)
            ),
        );
    }
    var fruits = fruitList
        .map<Widget>((fruit) => emojiButton(fruit))
        .toList();

    @override
    Widget build(BuildContext context) {
        return new Column(
            // 5x5 matrix of potential fruit squares.
            children: <Widget>[
                // Container(
                // decoration: BoxDecoration(color: Colors.black),
                // child: GridView(
                //     shrinkWrap: true,
                //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //     crossAxisSpacing: 2,
                //     mainAxisSpacing: 2,
                //     crossAxisCount: 5,
                //     ),
                //     children: blocks,
                // ),
                // ),
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
            ],
      ),
  }
}