import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oak_assignment/components/reusableButton.dart';
import 'package:oak_assignment/models/firebase_api.dart';
import 'package:oak_assignment/screens/homeScreen.dart';

class OnBoardingScreen extends StatefulWidget {
  static String id = 'OnBoarding Screen';
  String phoneNumber;
  String? uid;
  OnBoardingScreen({super.key, required this.phoneNumber, required this.uid});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController nameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  String userName = '';
  String email = '';
  String phnNumber = '';
  String? uid = '';

  @override
  void initState() {
    uid = widget.uid;
    phnNumber = widget.phoneNumber;
    super.initState();
  }

  @override
  void dispose() {
    nameTextController.dispose();
    emailTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset('assets/svg/back_icon.svg')),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Just a step away !',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 44,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border:
                                Border.all(width: 1, color: Color(0xFFD7D7D7))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 250,
                            height: 30,
                            child: TextField(
                              autofocus: true,
                              onChanged: (value) {
                                userName = nameTextController.text;
                              },
                              controller: nameTextController,
                              keyboardType: TextInputType.name,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Full name\u002A',
                                  hintStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFFAAAAAA))),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 44,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                width: 1, color: const Color(0xFFD7D7D7))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 250,
                            height: 30,
                            child: TextField(
                              controller: emailTextController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Email ID\u002A',
                                  hintStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFFAAAAAA))),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
                child: InkWell(
                    onTap: () async {
                      userSetup(
                          id: uid.toString(),
                          fullName: nameTextController.text.trim(),
                          email: emailTextController.text.trim(),
                          phoneNo: phnNumber);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen(
                                    userName:
                                        nameTextController.text.split(' ')[0],
                                  )));
                    },
                    child: ReusableButton(btnText: 'Let\'s Start')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
