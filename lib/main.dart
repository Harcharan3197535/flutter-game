//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> number = ["", "", "", "", "", "", "", "", ""];
  int gamer = 0;
  bool turn = true;
  int one = 0;
  int two = 0;
  TextEditingController gamecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: Text(
                    "Player One",
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Player Two",
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ],
          ),
        ),
        backgroundColor: Colors.amber,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 3,
          crossAxisSpacing: 2,
          childAspectRatio: 2.3,
        ),
        itemCount: number.length,
        shrinkWrap: true,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              _tapped(index);
              setState(() {});
            },
            child: Card(
              color: Colors.teal[100],
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    number[index],
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (turn && number[index] == '') {
        number[index] = 'O';
        gamer++;
        setState(() {});
      } else if (!turn && number[index] == '') {
        number[index] = 'X';
        gamer++;
      }

      turn = !turn;
      _checkwinner();
    });
  }

  void _checkwinner() {
    if (number[0] == number[1] && number[0] == number[2] && number[0] != '') {
      _showQDialog(number[0]);
    }
    if (number[3] == number[4] && number[3] == number[5] && number[3] != '') {
      _showQDialog(number[3]);
    }
    if (number[6] == number[7] && number[6] == number[8] && number[6] != '') {
      _showQDialog(number[6]);
    }
    //checking column code that win the game.
    if (number[0] == number[3] && number[0] == number[6] && number[0] != '') {
      _showQDialog(number[0]);
    }
    if (number[1] == number[4] && number[1] == number[7] && number[1] != '') {
      _showQDialog(number[1]);
    }
    if (number[2] == number[5] && number[2] == number[8] && number[2] != '') {
      _showQDialog(number[2]);
    }
    // another code that win the game.
    if (number[0] == number[4] && number[0] == number[8] && number[0] != '') {
      _showQDialog(number[0]);
    }
    if (number[2] == number[4] && number[2] == number[6] && number[2] != '') {
      _showQDialog(number[2]);
    } else if (gamer == 9) {
     // _showQDialog();
    }
  }

  void _showQDialog(String winner) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "\" " + winner + " \" is Winner!!!",
              style: TextStyle(
                color: Colors.teal,
                fontSize: 25,
              ),
            ),
            content: Text(
              " The Game Is End Here.",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            actions: [
              TextButton(
                  child: Text(
                    "Reset ",
                    style: TextStyle(color: Colors.black87),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    _clearGameBoard();
                  }),
            ],
          );
        });
    if (winner == 'O') {
      one++;
    } else if (winner == 'X') {
      two++;
    }
  }

  void _clearGameBoard() {
    setState(() {
      one = 0;
      two = 0;
      for (int i = 0; i < 9; i++) {
        number[i] = '';
      }
    });
    gamer = 0;
  }
}
