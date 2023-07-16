import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class CouponTile extends StatelessWidget {
  String cardTitle;
  String bgImgLoc;
  String couponCode;

  CouponTile(
      {super.key,
      required this.cardTitle,
      required this.bgImgLoc,
      required this.couponCode});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      width: MediaQuery.of(context).size.width * 0.87,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.black),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image: AssetImage(bgImgLoc), fit: BoxFit.fitWidth)),
          ),
          Positioned(
            left: 15,
            top: 12,
            child: Text(
              cardTitle,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ),
          Positioned(
            bottom: 15,
            left: 15,
            child: DottedBorder(
              radius: const Radius.circular(22),
              dashPattern: const [5, 3],
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              color: const Color(0xFF7B7B7B),
              strokeWidth: 1,
              child: Center(
                child: Text(
                  couponCode,
                  style: const TextStyle(color: Color(0xFFF7E5B7)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
