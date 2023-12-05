import 'dart:html';

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
  bool Turn = true;
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
      if (Turn && number[index] == '') {
        number[index] = 'O';
        gamer++;
        setState(() {});
      } else if (!Turn && number[index] == '') {
        number[index] = 'X';
        gamer++;
        setState(() {});
      }

      Turn = !Turn;
      _winner();
    });
  }

  void _winner() {
    if (number[0] == number[1] && number[0] == number[2] && number[0] == '') {}
    if (number[3] == number[4] && number[3] == number[5] && number[3] == '') {}
    if(number[6] == number[7] && number[6] == number[8] && number[6] == '') {}
  }

  showQDailog(int index) {
    var controller = TextEditingController();
    return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text("Winner Of The Game."),
              content: const Text(
                "",
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 20,
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      controller.clear();
                      setState(() {});
                    },
                    child: Text("Reset"))
              ],
            ));
  }
}
