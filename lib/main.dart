import 'package:flutter/material.dart';
import 'package:oak_assignment/screens/homeScreen.dart';
import 'package:oak_assignment/screens/loginScreen.dart';
import 'package:oak_assignment/screens/onBoardiingScreen.dart';
import 'package:oak_assignment/screens/otpScreen.dart';
import 'package:oak_assignment/screens/splashScreen1.dart';
import 'package:oak_assignment/screens/splashScreen2.dart';
import 'package:oak_assignment/screens/walkthroughScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:oak_assignment/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen1.id,
      routes: {
        SplashScreen1.id: (context) => const SplashScreen1(),
        SplashScreen2.id: (context) => const SplashScreen2(),
        HomeScreen.id: (context) => HomeScreen(),
        WalkthroughScreen.id: (context) => const WalkthroughScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        OtpScreen.id: (context) => OtpScreen(),
      },
    );
  }
}
