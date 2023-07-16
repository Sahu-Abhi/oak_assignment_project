import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:oak_assignment/screens/otpScreen.dart';

import '../components/reusableButton.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'Login Screen';
  static String verify = '';
  static String phoneNumber = '';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneNumberController = TextEditingController();
  String countryCode = '+91';
  bool showSpinner = false;

  void _load() {
    setState(() {
      showSpinner = true;
    });

    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        showSpinner = false;
      });
    });
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.401,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          child: SvgPicture.asset(
                            'assets/svg/login_bg.svg',
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                          child: Center(
                            child: Column(
                              children: [
                                SvgPicture.asset(
                                  'assets/svg/logo_lg.svg',
                                  height: 70,
                                  width: 70,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  'CraftMyPlate',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFFFCFFF7)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  // Body
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Login or Signup',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF787878)),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 44,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  width: 1, color: Color(0xFFD7D7D7))),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                '+91',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: 250,
                                height: 30,
                                child: TextField(
                                  onChanged: (value) {
                                    LoginScreen.phoneNumber = countryCode +
                                        phoneNumberController.text;
                                  },
                                  controller: phoneNumberController,
                                  keyboardType: TextInputType.phone,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Enter Phone Number',
                                      hintStyle: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFFAAAAAA))),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () async {
                            _load();
                            await FirebaseAuth.instance.verifyPhoneNumber(
                              phoneNumber: LoginScreen.phoneNumber,
                              verificationCompleted:
                                  (PhoneAuthCredential credential) {},
                              verificationFailed: (FirebaseAuthException e) {},
                              codeSent:
                                  (String verificationId, int? resendToken) {
                                LoginScreen.verify = verificationId;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => OtpScreen(
                                      phnNumber: LoginScreen.phoneNumber,
                                    ),
                                  ),
                                );
                              },
                              codeAutoRetrievalTimeout:
                                  (String verificationId) {},
                            );
                          },
                          child: ReusableButton(
                            btnText: 'Continue',
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 20),
                child: Center(
                  child: RichText(
                    text: const TextSpan(
                        text: ' By continuing, you agree to our\n',
                        style: TextStyle(color: Color(0xFF7B7B7B)),
                        children: [
                          TextSpan(
                            text: 'Terms of Service',
                            style: TextStyle(
                                color: Color(0xFF7B7B7B),
                                decoration: TextDecoration.underline),
                          ),
                          TextSpan(
                            text: '   ',
                          ),
                          TextSpan(
                              text: 'Privacy Policy',
                              style: TextStyle(
                                  color: Color(0xFF7B7B7B),
                                  decoration: TextDecoration.underline))
                        ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
