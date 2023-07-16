import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class NavIcon extends StatelessWidget {
  String icon;
  String title;
  bool isActive;
  NavIcon(
      {super.key,
      required this.icon,
      required this.title,
      this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          icon,
          height: 25,
          width: 25,
        ),
        Text(
          title,
          style: TextStyle(
              color: isActive ? kPrimaryColor : const Color(0xFF7E7E7E),
              fontSize: 10,
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
