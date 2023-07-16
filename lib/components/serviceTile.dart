import 'package:flutter/material.dart';
import 'package:oak_assignment/components/serviceBullet.dart';

import '../constants.dart';

class ServicesTile extends StatelessWidget {
  String img;
  String icon;
  String title;
  String b1;
  String b2;
  String b3;
  String b4;
  ServicesTile({
    required this.img,
    required this.icon,
    required this.title,
    required this.b1,
    required this.b2,
    required this.b3,
    required this.b4,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.card,
      elevation: 8,
      borderRadius: BorderRadius.circular(6),
      child: Container(
        height: 347,
        width: 310,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              height: 120,
              width: 278,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                image: DecorationImage(
                  image: AssetImage(img),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                children: [
                  Image.asset(
                    icon,
                    height: 28,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                        color: kPrimaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            ServiceBullets(
              text: b1,
            ),
            ServiceBullets(
              text: b2,
            ),
            ServiceBullets(
              text: b3,
            ),
            ServiceBullets(
              text: b4,
            ),
            SizedBox(
              height: 10,
            ),
            const Center(
              child: Text(
                'Know More',
                style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
