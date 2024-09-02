import 'package:financial_education/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:financial_education/firstPage.dart';
import 'package:financial_education/sign_in.dart';
import 'package:financial_education/terms_and_condition.dart';
import 'package:financial_education/privacy_policy.dart';
import 'package:financial_education/forgot_password.dart';

import 'otp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: '/otp-screen',

      routes: {

        '/get-started': (context) => const firstPage(),
        '/sign-up': (context) => const SignUp(),
        '/sign-in': (context) => const SignIn(),
        '/terms-and-conditions': (context) => const TermsAndConditions(),
        '/privacy-policy': (context) => const PrivacyPolicy(),
        '/forgot-password': (context) => const ForgotPassword(),
        '/otp-screen': (context) => const OtpScreen(),

        // '/loading': (context) => const locations(),
        // '/home': (context) => const home(),
        // '/location': (context) => const location(),
      },



      home: const firstPage(),
    );
  }
}

