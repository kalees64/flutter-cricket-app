import 'package:flutter/material.dart';
import 'dart:math';

class CricketScore extends StatefulWidget {
  const CricketScore({super.key});

  @override
  State<CricketScore> createState() {
    return _CricketScoreState();
  }
}

class _CricketScoreState extends State<CricketScore> {
  int initialRun = 0;
  int totalScore = 0;
  int finalScore = 0;
  bool restart = false;

  generateScore() {
    setState(() {
      initialRun = Random().nextInt(6) + 1;
      if (initialRun == 5) {
        finalScore = totalScore;
        // totalScore = 0;
        restart = true;
        return;
      }
      totalScore += initialRun;
    });
  }

  restartGame() {
    setState(() {
      totalScore = 0;
      finalScore = 0;
      restart = false;
      initialRun = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cricket 64"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        color: Colors.transparent,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 15,
            children: [
              Image.asset(
                'assets/images/cric-$initialRun.png',
                width: 200,
                height: 200,
              ),
              // Text("$initialRun"),

              restart
                  ? TextButton(
                      onPressed: restartGame,
                      child: Text("Restart the Game"),
                    )
                  : TextButton(
                      onPressed: generateScore,
                      child: Text("Swing the Bat"),
                    ),
              Text("Total Score: $totalScore"),
              finalScore > 0 ? Text("Your Score: $totalScore") : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
