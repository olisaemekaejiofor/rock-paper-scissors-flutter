import 'dart:math';

import 'package:flutter/material.dart';

class TheHome extends StatefulWidget {
  @override
  _TheHomeState createState() => _TheHomeState();
}

class _TheHomeState extends State<TheHome> {
  dynamic color;
  String image;
  int score = 0;
  String result = "";

  compChoice() {
    var choices = ['rock', 'paper', 'scissors'];
    final random = new Random();
    var i = random.nextInt(choices.length);
    return choices[i];
  }

  win() {
    setState(() {
      score++;
      result = "You win am sha...him father";
    });
  }

  loose() {
    setState(() {
      if (score > 0) {
        score = score - 1;
      }
      score = score;
      result = "You don loose...ntoor!";
    });
  }

  draw() {
    setState(() {
      result = "Alaye na draw";
    });
  }

  gameContainer(dynamic color, String image) {
    return GestureDetector(
      onTap: () {
        print("User picked " + image);
        String choice = compChoice();
        switch (image + choice) {
          case "rockscissors":
          case "paperrock":
          case "scissorspaper":
            win();
            break;
        }
        switch (image + choice) {
          case "rockpaper":
          case "paperscissors":
          case "scissorsrock":
            loose();
            break;
        }
        switch (image + choice) {
          case "rockrock":
          case "paperpaper":
          case "scissorsscissors":
            draw();
            break;
        }
      },
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: color, width: 10),
            left: BorderSide(color: color, width: 10),
            right: BorderSide(color: color, width: 10),
            bottom: BorderSide(color: color, width: 10),
          ),
          borderRadius: BorderRadius.circular(50.0),
          color: Colors.white,
        ),
        child: Center(
          child: Image(
            image: AssetImage("assets/" + image + ".png"),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Color(0xff1f3756),
              Color(0xff141539),
            ],
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 60.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.white),
                    left: BorderSide(color: Colors.white),
                    right: BorderSide(color: Colors.white),
                    bottom: BorderSide(color: Colors.white),
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  children: <Widget>[
                    Text(
                      "ROCK\nPAPER\nSCISSORS",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                        height: 0.75,
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          padding: EdgeInsets.all(6.0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                "SCORE",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                score.toString(),
                                style: TextStyle(
                                  fontSize: 22.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5.0),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
                height: 90,
                child: Center(
                  child: Text(
                    result,
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      gameContainer(Color(0xffec9e0e), "rock"),
                      Expanded(child: SizedBox()),
                      gameContainer(Color(0xff4865f4), "paper"),
                    ],
                  ),
                  SizedBox(height: 50),
                  gameContainer(Color(0xffdc2e4e), "scissors"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
