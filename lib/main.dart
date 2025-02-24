import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Flutter Card Design';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Card Project',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: const Text(
            appTitle,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: false,
        ),
        body: Center(
          child: InstaCard(), // Updated InstaCard with a working image slider
        ),
      ),
    );
  }
}

// InstaCard now includes an image slider (carousel)
class InstaCard extends StatelessWidget {
  final List<String> imgList = [
    'img.jpg',
    'img1.jpg',
    'img2.jpg',
    'img3.jpg',
    'img4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // **Image Carousel Slider**
          CarouselSlider(
            options: CarouselOptions(
              height: 300.0,
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 16 / 9,
              viewportFraction: 0.9,
            ),
            items: imgList.map((imageUrl) {
              return Builder(
                builder: (BuildContext context) {
                  return ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10)),
                    child: Image.network(
                      imageUrl,
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              );
            }).toList(),
          ),

          // **Icons Row Below the Image Slider**
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite_border, size: 28),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.chat_bubble_outline, size: 28),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.send, size: 28),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.bookmark_border_outlined, size: 28),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

