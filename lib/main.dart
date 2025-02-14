import 'package:flutter/material.dart';
import 'package:cricket_app/widgets/cricket_scorer.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: CricketScore());
  }
}
