import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ServiceBullets extends StatelessWidget {
  String text;
  ServiceBullets({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      child: Row(
        children: [
          SvgPicture.asset('assets/svg/bullet.svg'),
          const SizedBox(
            width: 5,
          ),
          Container(
            width: 250,
            child: Text(
              text,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  overflow: TextOverflow.fade),
            ),
          ),
        ],
      ),
    );
  }
}
