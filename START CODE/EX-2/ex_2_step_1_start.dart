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
        children: const [
          FavoriteCard(),
          Divider(height: 2, color: Colors.grey),

          FavoriteCard(),
          Divider(height: 2, color: Colors.grey),

          FavoriteCard(),
          Divider(height: 2, color: Colors.grey),
        ],
      ),
    ),
  ),
);

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          // Text Section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("title", style: TextStyle(color: Colors.blue)),
                Text("description"),
              ],
            ),
          ),

          // Heart Icon
          const HeartIcon(),
        ],
      ),
    );
  }
}

class HeartIcon extends StatefulWidget {
  const HeartIcon({super.key});

  @override
  State<HeartIcon> createState() => _HeartIconState();
}

class _HeartIconState extends State<HeartIcon> {
  bool iconSelected = false;

  void toggleHeart() {
    setState(() {
      iconSelected = !iconSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: toggleHeart,
      icon: Icon(
        Icons.favorite,
        color: iconSelected ? Colors.red : Colors.grey,
      ),
    );
  }
}
