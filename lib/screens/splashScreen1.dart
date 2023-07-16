import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oak_assignment/constants.dart';
import 'package:oak_assignment/screens/splashScreen2.dart';

class SplashScreen1 extends StatefulWidget {
  static String id = 'Splash Screen 1';
  const SplashScreen1({super.key});

  @override
  State<SplashScreen1> createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  @override
  void initState() {
    _naviagtetoSplash2();
    super.initState();
  }

  _naviagtetoSplash2() async {
    await Future.delayed(Duration(milliseconds: 1200), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SplashScreen2()));
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
              color: kTertiryColor,
            ),
            child: FittedBox(
              fit: BoxFit.fill,
              child: SvgPicture.asset(
                'assets/svg/splash_bg.svg',
                height: 110,
                width: 88,
              ),
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
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Welcome',
                  style: TextStyle(
                      fontSize: 32,
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
