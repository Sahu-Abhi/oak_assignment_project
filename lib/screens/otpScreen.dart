import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oak_assignment/components/reusableButton.dart';
import 'package:oak_assignment/constants.dart';
import 'package:oak_assignment/screens/loginScreen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'onBoardiingScreen.dart';

class OtpScreen extends StatefulWidget {
  OtpScreen({super.key, this.phnNumber = ''});
  String phnNumber;
  static String id = 'OTP Screen';

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _otpTextController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  String phoneNumber = '';
  String otp = '';
  String _verificationId = '';
  int? _resendToken;

  @override
  void initState() {
    phoneNumber = widget.phnNumber;
    super.initState();
  }

  @override
  void dispose() {
    _otpTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset('assets/svg/back_icon.svg')),
                const Text(
                  'OTP Verification',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  width: 40,
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            const Center(
              child: Text(
                'We have sent a verification code to',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF545454)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '+91-XXXXXX${phoneNumber.substring(9)}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SvgPicture.asset('assets/svg/green_tick.svg'),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: PinCodeTextField(
                autoUnfocus: true,
                cursorColor: const Color(0xFF868686),
                keyboardType: TextInputType.number,
                autoFocus: true,
                autoDismissKeyboard: true,
                appContext: context,
                length: 6,
                obscureText: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  activeColor: const Color(0xFF868686),
                  selectedColor: const Color(0xFF868686),
                  inactiveColor: const Color(0xFF868686),
                  inactiveFillColor: Colors.transparent,
                  selectedFillColor: Colors.transparent,
                  shape: PinCodeFieldShape.underline,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: Colors.transparent,
                ),
                animationDuration: const Duration(milliseconds: 300),
                backgroundColor: Colors.transparent,
                enableActiveFill: true,
                controller: _otpTextController,
                onCompleted: (v) {
                  print("Completed");
                },
                onChanged: (value) {
                  print(value);
                  setState(() {
                    otp = value;
                  });
                },
                beforeTextPaste: (text) {
                  print("Allowing to paste $text");
                  //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                  //but you can show anything you want here, like your pop up saying wrong paste format or etc
                  return true;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: InkWell(
                  onTap: () async {
                    try {
                      PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                              verificationId: LoginScreen.verify,
                              smsCode: _otpTextController.text);
                      await auth.signInWithCredential(credential);
                      print('successfully registered');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OnBoardingScreen(
                            phoneNumber: phoneNumber,
                            uid: auth.currentUser?.uid.toString(),
                          ),
                        ),
                      );

                      // clear otp text
                      _otpTextController.clear();
                    } catch (e) {}
                  },
                  child: ReusableButton(btnText: 'Submit')),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Didn\'t receive code?',
                  style: TextStyle(
                    color: Color(0xFF868686),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                InkWell(
                  onTap: () async {
                    try {
                      await FirebaseAuth.instance.verifyPhoneNumber(
                        forceResendingToken: _resendToken,
                        phoneNumber: phoneNumber,
                        verificationCompleted:
                            (PhoneAuthCredential credential) {},
                        verificationFailed: (FirebaseAuthException e) {},
                        codeSent:
                            (String verificationId, int? resendToken) async {
                          _verificationId = verificationId;
                          _resendToken = resendToken;
                          // Display alert
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Resent otp to $phoneNumber'),
                            ),
                          );
                        },
                        codeAutoRetrievalTimeout: (String verificationId) {
                          verificationId = _verificationId;
                        },
                      );
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: const Text(
                    '  Resend Again.',
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
