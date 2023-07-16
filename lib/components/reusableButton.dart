import 'package:flutter/material.dart';

import '../constants.dart';

class ReusableButton extends StatelessWidget {
  String btnText;
  ReusableButton({required this.btnText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          btnText,
          style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xFFFFFFFF)),
        ),
      ),
    );
  }
}
