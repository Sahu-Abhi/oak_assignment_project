import 'package:flutter/material.dart';

import '../constants.dart';

class DefaultMenuTille extends StatelessWidget {
  String title;

  DefaultMenuTille({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 149,
      width: 174,
      child: Stack(children: [
        Positioned(
          left: 20,
          child: Material(
            type: MaterialType.card,
            elevation: 5,
            borderRadius: BorderRadius.circular(7),
            child: Container(
              height: 149,
              width: 149,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(7)),
              child: Stack(
                children: [
                  Positioned(
                    left: 10,
                    top: 5,
                    child: Text(
                      title,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Positioned(
                    right: 10,
                    top: 30,
                    child: Text(
                      '3 starters\n3 maincourse\n3 desserts\n3 drinks',
                      style:
                          TextStyle(fontSize: 11, fontWeight: FontWeight.w300),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    bottom: 40,
                    child: Row(
                      children: const [
                        Icon(
                          Icons.person,
                          size: 12,
                          color: Color(0xFF7E7E7E),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          'Min 800',
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF7E7E7E)),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 10,
                    bottom: 10,
                    child: Row(
                      children: const [
                        Text(
                          'Starts at',
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 11,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '₹ 777',
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 5,
          child: Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/default_menu.png',
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
