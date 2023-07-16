import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:oak_assignment/constants.dart';
import 'package:oak_assignment/screens/loginScreen.dart';
import 'package:rive/rive.dart';

class WalkthroughScreen extends StatefulWidget {
  static String id = 'Walkthrough Screen';
  const WalkthroughScreen({super.key});

  @override
  State<WalkthroughScreen> createState() => _WalkthroughScreenState();
}

class _WalkthroughScreenState extends State<WalkthroughScreen> {
  final _introKey = GlobalKey<IntroductionScreenState>();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 100),
              child: IntroductionScreen(
                dotsDecorator: DotsDecorator(
                  size: Size(24, 8),
                  activeSize: Size(24, 8),
                  activeColor: kPrimaryColor,
                  color: Color(0xFFE0D4EC),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                key: _introKey,
                pages: [
                  PageViewModel(
                      image: const RiveAnimation.asset(
                        'assets/rive/walkthrough1_animation.riv',
                      ),
                      // SvgPicture.asset(
                      //   'assets/svg/walkthrough1.svg',
                      // ),
                      decoration: const PageDecoration(
                        titlePadding: EdgeInsets.zero,
                        imagePadding: EdgeInsets.zero,
                        contentMargin: EdgeInsets.zero,
                        footerPadding: EdgeInsets.zero,
                      ),
                      title: '',
                      bodyWidget: WalkthroughColumn(
                        title: 'Create Your Own Plate',
                        body:
                            'Create unforgettable memories with our unique feature to curate your favorite cuisines and food, tailored to your special occasion.',
                      )),
                  PageViewModel(
                    image: const RiveAnimation.asset(
                      'assets/rive/walkthrough2_animation.riv',
                      fit: BoxFit.contain,
                    ),

                    // SvgPicture.asset(
                    //   'assets/svg/walkthrough2.svg',
                    // ),
                    decoration: const PageDecoration(
                      titlePadding: EdgeInsets.zero,
                      imagePadding: EdgeInsets.zero,
                      contentMargin: EdgeInsets.zero,
                      footerPadding: EdgeInsets.zero,
                    ),
                    title: '',
                    bodyWidget: WalkthroughColumn(
                      title: 'Exquisite Catering',
                      body:
                          'Experience culinary artistry like never before with our innovative and exquisite cuisine creations',
                    ),
                  ),
                  PageViewModel(
                    image: const RiveAnimation.asset(
                      'assets/rive/walkthrough3_animation.riv',
                    ),
                    // SvgPicture.asset(
                    //   'assets/svg/walkthrough3.svg',
                    // ),
                    decoration: const PageDecoration(
                      titlePadding: EdgeInsets.zero,
                      imagePadding: EdgeInsets.zero,
                      contentMargin: EdgeInsets.zero,
                      footerPadding: EdgeInsets.zero,
                    ),
                    title: '',
                    bodyWidget: WalkthroughColumn(
                      title: 'Personal Order Executive',
                      body:
                          'Embark on a personalized culinary journey with our dedicated one-to-one customer support, ensuring a seamless and satisfying experience every step of the way.',
                    ),
                  ),
                ],
                showNextButton: false,
                showDoneButton: false,
                controlsPadding: const EdgeInsets.only(bottom: 100),
                onChange: (int pg_no) {
                  if (pg_no == 2) {
                    setState(() {
                      isLastPage = true;
                    });
                  } else if (pg_no == 1 || pg_no == 0) {
                    setState(() {
                      isLastPage = false;
                    });
                  }
                },
              ),
            ),
            Positioned(
              right: 20,
              top: 20,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                },
                child: Container(
                  height: 22,
                  width: 56,
                  color: const Color(0xFFE8E0EA),
                  child: const Center(
                    child: Text(
                      'Skip',
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 100,
              left: isLastPage ? 90 : 150,
              child: InkWell(
                onTap: () {
                  int? pg_no = _introKey.currentState?.getCurrentPageNumber();
                  if (pg_no! < 2) {
                    _introKey.currentState?.next();
                  } else if (pg_no == 2) {
                    Navigator.pushNamed(context, LoginScreen.id);
                  }
                  if (pg_no >= 1) {
                    setState(() {
                      isLastPage = true;
                    });
                  } else {
                    setState(() {
                      isLastPage = false;
                    });
                  }
                },
                child: Stack(
                  children: [
                    Container(
                      height: 60,
                      width: isLastPage ? 180 : 60,
                      decoration: BoxDecoration(
                          borderRadius:
                              isLastPage ? BorderRadius.circular(30) : null,
                          shape:
                              isLastPage ? BoxShape.rectangle : BoxShape.circle,
                          color: const Color(0xFFE0D4EC)),
                    ),
                    Visibility(
                      visible: isLastPage ? true : false,
                      child: const Positioned(
                        left: 20,
                        top: 20,
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: kPrimaryColor),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 9,
                      left: isLastPage ? 120 : 9,
                      child: Container(
                        height: 42,
                        width: 42,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: kPrimaryColor),
                        child: const Icon(
                          Icons.arrow_forward_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WalkthroughColumn extends StatelessWidget {
  String title;
  String body;
  WalkthroughColumn({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.82,
          child: Text(
            body,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: Color(0xFF7B7B7B)),
          ),
        ),
      ],
    );
  }
}
