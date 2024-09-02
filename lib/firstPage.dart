import 'package:flutter/material.dart';

class firstPage extends StatefulWidget {
  const firstPage({super.key});

  @override
  State<firstPage> createState() => _firstPageState();
}

class _firstPageState extends State<firstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  const SizedBox(height: 210),

                   Image.asset('Assets/_Layer_Banner.png'),
                  const SizedBox(height: 120),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: Text('Learn to Master Your Finances',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight:FontWeight.w700,
                      fontFamily: 'WixMadeRegular',
                      fontSize: 25,
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 60,left: 60, top: 15),
                    child: Text('This is dummy. It is not meant to be read. It is placed here only for show.',
                        textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight:FontWeight.w500,
                      fontFamily: 'WixMadeRegular',
                      fontSize: 16,
                      color: const Color(0xFF333333).withOpacity(0.8)
                    )),
                  ),

                  const SizedBox(height: 40),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.pushReplacementNamed(context, '/sign-in');
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                            left: 16,
                            top: 24,
                            bottom: 24,
                          ),
                          height: 46,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: const Color(0xFF333333).withOpacity(0.9),
                          ),
                          child: Center(
                            child: const Text('Sign In',
                              style: TextStyle(
                              color: Colors.white,
                                fontWeight:FontWeight.w500,
                                fontFamily: 'WixMadeRegular',
                                fontSize: 14,
                            ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushReplacementNamed(context, '/sign-up');
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                            right: 16,
                            top: 24,
                            bottom: 24,
                          ),
                          height: 46,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: const Color(0xFFD8C193),
                          ),
                          child: Center(
                            child: const Text('New User?',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight:FontWeight.w500,
                                fontFamily: 'WixMadeRegular',
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     GestureDetector(
                       onTap: () {
                         Navigator.pushNamed(context, '/terms-and-conditions');
                       },
                       child: const Text('Terms of Use       ',
                         style: TextStyle(
                           fontWeight:FontWeight.w400,
                           fontFamily: 'WixMadeRegular',
                           fontSize: 14,
                         ),
                       ),
                     ),
                      const Text('|',
                        style: TextStyle(
                          fontWeight:FontWeight.w400,
                          fontFamily: 'WixMadeRegular',
                          fontSize: 14,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/privacy-policy');
                        },
                        child: const Text('       Privacy Policy',
                          style: TextStyle(
                            fontWeight:FontWeight.w400,
                            fontFamily: 'WixMadeRegular',
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  )

                ],
              ),
            )),
      ) ,

    );
  }
}
