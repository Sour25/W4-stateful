import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Favorite cards"),
      ),
      body: Column(
        children: [
          favoriteCard(),
          Container(height: 2, color: Colors.grey),

          favoriteCard(),
          Container(height: 2, color: Colors.grey),

          favoriteCard(),
          Container(height: 2, color: Colors.grey),
        ],
      ),
    ),
  ),
);

class favoriteCard extends StatelessWidget {
  const favoriteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("title", style: TextStyle(color: Colors.blue)),
                Text("description"),
              ],
            ),
          ),
          const Spacer(),
          heartIcon(),
        ],
      ),
    );
  }
}

class heartIcon extends StatefulWidget {
  const heartIcon({super.key});

  @override
  State<heartIcon> createState() => _heartIconState();
}

class _heartIconState extends State<heartIcon> {
  bool iconSelected = false;

  void selectedHeart() {
    setState(() {
      iconSelected = !iconSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: selectedHeart,
      icon: Icon(
        Icons.favorite,
        color: iconSelected ? Colors.red : Colors.grey,
      ),
    );
  }
}
