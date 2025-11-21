import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: const Color(0xFFB9CF59), 
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 30),
        children: const [
          ScoreBar(title: "My score in Flutter"),
          ScoreBar(title: "My score in Dart"),
          ScoreBar(title: "My score in React"),
        ],
      ),
    ),
  ),
);

class ScoreBar extends StatelessWidget {
  final String title;
  const ScoreBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Center(
        child: Container(
          width: 340,
          padding: const EdgeInsets.symmetric(vertical: 25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  decoration: TextDecoration.none,
                ),
              ),
              const SizedBox(height: 20),
              const ControlScore(),
            ],
          ),
        ),
      ),
    );
  }
}

class ControlScore extends StatefulWidget {
  const ControlScore({super.key});

  @override
  State<ControlScore> createState() => _ControlScoreState();
}

class _ControlScoreState extends State<ControlScore> {
  int score = 5;
  final int fullScore = 10;

  void increaseScore() {
    setState(() {
      score = (score + 1).clamp(0, fullScore);
    });
  }

  void decreaseScore() {
    setState(() {
      score = (score - 1).clamp(0, fullScore);
    });
  }

  @override
  Widget build(BuildContext context) {
    const double barWidth = 280;
    final double filledWidth = (barWidth * score) / fullScore;

   
    Color barColor;
    if (score <= 4) {
      barColor = const Color(0xFFB7E6A5); 
    } else if (score <= 8) {
      barColor = const Color(0xFF7CBD64); 
    } else {
      barColor = const Color(0xFF3E6B2B); 
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: decreaseScore,
              icon: const Icon(Icons.remove, size: 28),
            ),
            const SizedBox(width: 40),
            IconButton(
              onPressed: increaseScore,
              icon: const Icon(Icons.add, size: 28),
            ),
          ],
        ),

        const SizedBox(height: 15),

        // Progress Bar
        Container(
          height: 35,
          width: barWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey.shade400, width: 2),
          ),
          child: Stack(
            children: [
              Container(
                width: filledWidth,
                decoration: BoxDecoration(
                  color: barColor,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
