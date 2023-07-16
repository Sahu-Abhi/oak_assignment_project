import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oak_assignment/constants.dart';
import 'package:oak_assignment/screens/walkthroughScreen.dart';

class SplashScreen2 extends StatefulWidget {
  static String id = 'Splash Screen 2';
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  _naviagtetoSplash2() async {
    await Future.delayed(Duration(milliseconds: 1200), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => WalkthroughScreen()));
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 1200), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceOut);
    controller.reverse(from: 1);
    controller.addListener(() {
      setState(() {});
    });
    _naviagtetoSplash2();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: kPrimaryColor,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: 'logo',
                  child: SvgPicture.asset(
                    'assets/svg/logo_lg.svg',
                    height: 141.55,
                    width: 124.62,
                  ),
                ),
                SizedBox(
                  height: (animation.value * 30) + 15,
                ),
                const Text(
                  'Craft My Plate',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                      color: kTertiryColor),
                ),
                const Text(
                  'you customise, We cater',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: kTertiryColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
