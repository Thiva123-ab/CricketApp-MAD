import 'package:flutter/material.dart';
import 'screens/cricket_game_screen.dart';

void main() {
  runApp(const MiniCricketApp());
}

class MiniCricketApp extends StatelessWidget {
  const MiniCricketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hides the debug banner for a cleaner UI
      title: 'Mini Cricket',
      theme: ThemeData(
        primaryColor: Colors.blue[900],
        scaffoldBackgroundColor: Colors.blue[600],
      ),
      home: const CricketGameScreen(),
    );
  }
}