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
  List<int> one = [];
  List<int> two = [];
  List<int> number = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  int gamer = 0;
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
                  onPressed: () {},
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
              gamer % 2 == 0 ? one.add(index) : two.add(index);
              gamer++;
            },
            child: Card(
              color: one.contains(index)
                  ? Colors.yellow
                  : two.contains(index)
                      ? Colors.black
                      : Colors.grey,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("${index}"),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: const Text(
              "Winner Player 1.",
              style: TextStyle(
                color: Colors.teal,
                fontSize: 20,
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    gamecontroller.clear();
                  },
                  child: Text("Reset"))
            ],
          );
        });
  }

  showQDailog(int index) {
    var controller = TextEditingController();
    return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              content: const Text(
                "Winner Player 2.",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      controller.clear();
                    },
                    child: Text("Reset"))
              ],
            ));
  }
}
