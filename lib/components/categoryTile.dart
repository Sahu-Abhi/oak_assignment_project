import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  String imagePath;
  String title;
  CategoryTile({super.key, required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset(
            imagePath,
            height: 64.71,
            width: 65,
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}
