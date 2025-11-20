import 'package:flutter/material.dart';

List<String> images = [
  "assets/w4-s2/bird.jpg",
  "assets/w4-s2/bird2.jpg",
  "assets/w4-s2/insect.jpg",
  "assets/w4-s2/girl.jpg",
  "assets/w4-s2/man.jpg",
];

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner:
        false, // Why this line ? Can you explain it ?// Removes the debug banner
    home: ImageViewer(),
  ),
);

class ImageViewer extends StatefulWidget {
  const ImageViewer({super.key});

  @override
  State<ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  int currentIndex = 0;

  void previousImage() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
      } else {
        currentIndex = images.length - 1; // Wrap around to last image
      }
    });
  }

  void nextImage() {
    setState(() {
      if (currentIndex < images.length - 1) {
        currentIndex++;
      } else {
        currentIndex = 0; // Wrap around to first image
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image Viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: previousImage,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed: nextImage,
            ),
          ),
        ],
      ),
      body: Center(
        child: Image.asset(
          images[currentIndex],
          height: 600,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
