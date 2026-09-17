import 'dart:math';
import 'package:flutter/material.dart';

class CricketGameScreen extends StatefulWidget {
  const CricketGameScreen({super.key});

  @override
  State<CricketGameScreen> createState() => _CricketGameScreenState();
}

class _CricketGameScreenState extends State<CricketGameScreen> {
  int balls = 6;
  int runs = 0;
  String currentStatus = '';
  final Random _random = Random();

  void _playOrRestart() {
    setState(() {
      if (balls > 0) {
        int score = _random.nextInt(7); // generates 0, 1, 2, 3, 4, 5, 6
        runs += score;
        balls -= 1;
        
        if (score == 0) {
          currentStatus = 'No Runs';
        } else {
          currentStatus = '$score Runs';
        }
      } else {
        // Restart logic
        balls = 6;
        runs = 0;
        currentStatus = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mini Cricket'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Images row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildImageBox('asset/bat.png'),
                _buildImageBox('asset/ball.png'),
              ],
            ),
            const SizedBox(height: 40),
            // Text Row for "Runs" and "Balls"
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Runs',
                  style: TextStyle(
                    fontSize: 20, 
                    color: Colors.white, 
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  'Balls',
                  style: TextStyle(
                    fontSize: 20, 
                    color: Colors.white, 
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Value Row for actual runs and balls count
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '$runs',
                  style: const TextStyle(
                    fontSize: 40, 
                    color: Colors.white, 
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  '$balls',
                  style: const TextStyle(
                    fontSize: 40, 
                    color: Colors.white, 
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            // Current Status Text (e.g., "3 Runs", "No Runs")
            Text(
              currentStatus,
              style: const TextStyle(
                fontSize: 20, 
                color: Colors.white, 
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 20),
            // Button (Bat or Restart)
            ElevatedButton(
              onPressed: _playOrRestart,
              style: ElevatedButton.styleFrom(
                backgroundColor: balls == 0 ? Colors.red : Colors.blue[900],
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                balls == 0 ? 'Restart' : 'Bat',
                style: const TextStyle(
                  fontSize: 18, 
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // A helper method to display actual images from assets
  Widget _buildImageBox(String imagePath) {
    return Container(
      width: 130,
      height: 130,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Image.asset(
        imagePath,
        fit: BoxFit.contain,
      ),
    );
  }
}
