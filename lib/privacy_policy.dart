import 'package:flutter/material.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: GestureDetector(
          onTap: (){
            FocusScope.of(context).requestFocus(FocusNode());
            Navigator.pushReplacementNamed(context, '/get-started');
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 25,
          ),
        ),
        title: Text('Privacy Policy',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'WixMadeRegular',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
              textAlign: TextAlign.justify
              ,style: TextStyle(
                fontSize: 16,
                fontFamily: 'WixMadeRegular',
                fontWeight: FontWeight.w600,
              ),),
          ),
      ),
    );
  }
}