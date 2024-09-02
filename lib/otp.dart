import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';


class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}


class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        leading:
        GestureDetector(
          onTap: (){
            FocusScope.of(context).requestFocus(FocusNode());
            Navigator.pushReplacementNamed(context, '/sign-in');
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 25,
          ),
        ),
        title: Text("OTP SCREEN",
            style: TextStyle(
          fontSize: 18,
          fontFamily: 'WixMadeRegular',
          fontWeight: FontWeight.w400,
        )),

      ),

      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text("Please Verify your email with the OTP received on Phone Number",
              textAlign: TextAlign.center,
              style: TextStyle(
            fontSize: 18,
            fontFamily: 'WixMadeRegular',
            fontWeight: FontWeight.w600,
          )),
          SizedBox(
            height: 20,
          ),
          Text("Enter the OTP code here",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF999999),
                fontSize: 14,
                fontFamily: 'WixMadeRegular',
                fontWeight: FontWeight.w600,
              )),
          SizedBox(
            height: 20,
          ),

          OtpTextField(
            numberOfFields: 4,
              borderColor:	Color(0xFFE7E7E7),
            focusedBorderColor: Color(0xFFD8C193),
            showFieldAsBox: true,
            onSubmit: (String verificationCode){
              showDialog(
                  context: context,
                  builder: (context){
                    return AlertDialog(
                      title: Text("Verification Code"),
                      content: Text('Code entered is $verificationCode'),
                    );
                  }
              );
            },
            // end onSubmit
          ),
          SizedBox(
            height: 20,
          ),

      Timer(const Duration(seconds: 5), handleTimeout),


          SizedBox(
            height: 20,
          ),


          RichText(text: TextSpan(
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'WixMadeRegular',
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
            children: [
              TextSpan(text: "Didn't Receive the Code? "),
              TextSpan(text: "Resend", style:
              TextStyle(
                color: Color(0xFFD8C193),
                fontFamily: 'WixMadeRegular',
                fontSize: 18,
                fontWeight: FontWeight.w500,

              ),
                  recognizer: TapGestureRecognizer()..onTap = (){

              }
              ),

            ]

          ),)

        ],
      ),
    );
  }
}


class TimerScreen extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  Timer? _timer;
  int _start = 60;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_start > 0) {
          _start--;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('60-Second Timer'),
      ),
      body: Center(
        child: Text(
          '$_start seconds remaining',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}