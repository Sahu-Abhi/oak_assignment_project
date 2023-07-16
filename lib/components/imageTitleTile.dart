import 'package:flutter/material.dart';

class ImageTitleTile extends StatelessWidget {
  final String imagePath;
  final String title;
  double height;
  double width;

  ImageTitleTile(
      {super.key,
      this.height = 120,
      this.width = 150,
      required this.imagePath,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.card,
      elevation: 5,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.topCenter,
            image: AssetImage(imagePath),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            Positioned(
                bottom: 8,
                left: 20,
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w400),
                )),
          ],
        ),
      ),
    );
  }
}
