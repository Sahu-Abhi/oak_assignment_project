import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class ImgTextCard extends StatelessWidget {
  String title;
  String body;
  String img;
  double bodyHeight;
  bool isSwapped;
  bool isSmallImg;
  ImgTextCard(
      {super.key,
      required this.title,
      required this.body,
      required this.img,
      this.isSwapped = false,
      this.isSmallImg = false,
      this.bodyHeight = 24});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 20,
          left: isSwapped ? 250 : 20,
          child: Container(
            height: 20,
            width: 20,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    blurRadius: 60, color: kTertiryColor, spreadRadius: 20)
              ],
            ),
          ),
        ),
        Row(
          children: [
            Container(
                height: 86.76,
                child: Row(
                  textDirection:
                      isSwapped ? TextDirection.rtl : TextDirection.ltr,
                  children: [
                    SizedBox(
                      width: isSmallImg ? 30 : 0,
                    ),
                    SvgPicture.asset(img),
                    SizedBox(
                      width: isSmallImg ? 30 : 10,
                    ),
                    SizedBox(
                      width: 190,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: bodyHeight,
                          ),
                          Text(
                            title,
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: kPrimaryColor),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            body,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ],
        )
      ],
    );
  }
}
