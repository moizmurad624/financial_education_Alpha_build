import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPasswordValidation with ChangeNotifier {
  String? _phoneError;

  String? get phoneError => _phoneError;


  void validationCheckPhone(String? value) {
    print("Moiz");
    if (value == null || value.isEmpty) {
      print("Moiz1");
      _phoneError = "Phone Number can't be Null";
    }
    else {
      print("Moiz2");
      _phoneError = null;
    }
    notifyListeners();
  }

}

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  String? phone;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ForgotPasswordValidation(),
      child: Scaffold(
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

        ),
        body: SingleChildScrollView(
          child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25, left: 18),
                    child: Text('Forgot Password',
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'WixMadeRegular',
                          fontWeight: FontWeight.w600,
                        )),
                  ),

                  SizedBox(
                    height: 25,
                  ),

                  Form(
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, bottom: 10),
                            child: RichText(text: TextSpan(
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'WixMadeRegular',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                                children: [
                                  TextSpan(text: 'Phone Number'),
                                  TextSpan(text: ' *', style: TextStyle(
                                      color: Color(0xFFD8C193)
                                  )),
                                ]
                            )),
                          ),

                          Consumer<ForgotPasswordValidation>(
                              builder: (context, forgotPasswordValidation, child) {
                                return Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: Color(0xFFF8F8F8),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Color(0xFF999999),
                                            blurRadius: 1.0,
                                            spreadRadius: 0.0,
                                            offset: Offset(0.0, 0.0))
                                      ]),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    child: TextFormField(
                                      autovalidateMode: AutovalidateMode.onUserInteraction,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        hintText: 'Enter Phone Number',
                                        hintStyle: TextStyle(
                                          color: Color(0xFF999999),
                                        ),
                                        border: InputBorder.none,
                                      ),
                                      onChanged: (value) {
                                        phone = value;
                                        forgotPasswordValidation.validationCheckPhone(phone);
                                      },
                                    ),
                                  ),
                                );
                              }
                          ),
                          Consumer<ForgotPasswordValidation>(
                              builder: (context,forgotPasswordValidation,child) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 20, top: 4),
                                  child: forgotPasswordValidation.phoneError != null
                                      ? Text(
                                    forgotPasswordValidation.phoneError!,
                                    style: const TextStyle(
                                      color: Colors.red,
                                      fontSize: 14,
                                    ),
                                  )
                                      : const SizedBox.shrink(),
                                );
                              }
                          ),

                          const SizedBox(
                            height: 50,
                          ),


                          Consumer<ForgotPasswordValidation>(
                              builder: (context, forgotPasswordValidation, child) {
                                return Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      forgotPasswordValidation.validationCheckPhone(phone);
                                    },
                                    child: Container(
                                      width: 410,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFD8C193),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text("Forgot Password"
                                          ,textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'WixMadeRegular',
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }
                          ),
                        ],

                      ) )

                ],
              )),
        ),
      ),
    );
  }
}
