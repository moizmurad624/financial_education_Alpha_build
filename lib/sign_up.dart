import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SignUpValidation with ChangeNotifier{
  String? _phoneError;
  String? _passwordError;
  String? _confirmPasswordError;

  String? get phoneError => _phoneError;
  String? get passwordError => _passwordError;
  String? get confirmPasswordError => _confirmPasswordError;

  void validationCheckPhone(String? value){
    print("Moiz");
    if (value == null || value.isEmpty)
    {
      print("Moiz1");
      _phoneError = "Phone Number can't be Null";
    }
    else {
      print("Moiz2");
      _phoneError = null;
    }
    notifyListeners();
  }

  void validationCheckName(String? value){
    if (value == null || value.isEmpty)
    {
      _passwordError = "Password can't be Null";
    }
    else {
      _passwordError = null;
    }
    notifyListeners();
  }

  void validationCheckConfirmPassword(String? value){
    if (value == null || value.isEmpty)
    {
      _confirmPasswordError = "Confirm Password can't be Null";
    }
    else {
      _confirmPasswordError = null;
    }
    notifyListeners();
  }



}

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  bool _isChecked = true;

  String? phone;
  String? password;
  String? confirmPassword;

  var _isObscurepassword;
  var _isObscureconfirmpassword;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _isObscurepassword = true;
    _isObscureconfirmpassword = true;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignUpValidation(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
              Navigator.pushReplacementNamed(context, '/get-started');
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
                    child: Text('Sign Up',
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'WixMadeRegular',
                          fontWeight: FontWeight.w600,
                        )),
                  ),

                  // SizedBox(height: 12),

                  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: Text('Please enter your details to create an account',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          fontFamily: 'WixMadeRegular',
                          color: Color(0xFF999999),
                        )),
                  ),
                  SizedBox(
                    height: 25,
                  ),

                  Form(
                    key: _formKey,
                    child: Column(
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

                        Consumer<SignUpValidation>(
                            builder: (context, signUpProvider, child) {
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
                                    signUpProvider.validationCheckPhone(phone);
                                  },
                                  ),
                              ),
                            );
                          }
                        ),
                        Consumer<SignUpValidation>(
                          builder: (context,signUpProvider,child) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 20, top: 4),
                              child: signUpProvider.phoneError != null
                                  ? Text(
                                signUpProvider.phoneError!,
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 14,
                                ),
                              )
                                  : SizedBox.shrink(),
                            );
                          }
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 20, bottom: 10, top: 15),
                          child: RichText(text: TextSpan(
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'WixMadeRegular',
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                              children: [
                                TextSpan(text: 'Password'),
                                TextSpan(text: ' *', style: TextStyle(
                                    color: Color(0xFFD8C193)
                                )),
                              ]
                          )),
                        ),

                        Consumer<SignUpValidation>(
                            builder: (context, signUpProvider, child) {
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
                                  padding: const EdgeInsets.only(left:  20),
                                  child: TextFormField(

                                    obscureText: _isObscurepassword,
                                    enableSuggestions: false,
                                    autocorrect: false,

                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    keyboardType: TextInputType.visiblePassword,
                                    decoration: InputDecoration(

                                      suffixIcon: IconButton(
                                        icon: _isObscurepassword
                                            ? const Icon(Icons.visibility_outlined,color: Color(0xFF999999),)
                                            : const Icon(Icons.visibility_off,color: Color(0xFF999999),),
                                        onPressed: (){
                                          setState(() {
                                            _isObscurepassword = !_isObscurepassword;
                                          });
                                        },
                                      ),

                                      hintText: 'Enter Password',
                                      hintStyle: TextStyle(
                                        color: Color(0xFF999999),
                                      ),
                                      border: InputBorder.none,
                                    ),
                                    onChanged: (value) {
                                      password = value;
                                      signUpProvider.validationCheckName(password);
                                    },
                                  ),
                                ),
                              );
                            }
                        ),
                        Consumer<SignUpValidation>(
                            builder: (context,signUpProvider,child) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 20, top: 4),
                                child: signUpProvider.passwordError != null
                                    ? Text(
                                  signUpProvider.passwordError!,
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 14,
                                  ),
                                )
                                    : SizedBox.shrink(),
                              );
                            }
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 20, bottom: 10, top: 15),
                          child: RichText(text: TextSpan(
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'WixMadeRegular',
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                              children: [
                                TextSpan(text: 'Confirm Password'),
                                TextSpan(text: ' *', style: TextStyle(
                                    color: Color(0xFFD8C193)
                                )),
                              ]
                          )),
                        ),

                        Consumer<SignUpValidation>(
                            builder: (context, signUpProvider, child) {
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
                                  padding: const EdgeInsets.only(left:  20),
                                  child: TextFormField(
                                    obscureText: _isObscureconfirmpassword,
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    keyboardType: TextInputType.visiblePassword,
                                    decoration: InputDecoration(

                                      suffixIcon: IconButton(
                                        icon: _isObscureconfirmpassword
                                            ? const Icon(Icons.visibility_outlined,color: Color(0xFF999999),)
                                            : const Icon(Icons.visibility_off,color: Color(0xFF999999),),
                                        onPressed: (){
                                          setState(() {
                                            _isObscureconfirmpassword = !_isObscureconfirmpassword;
                                          });
                                        },
                                      ),

                                      hintText: 'Enter Confirm Password',
                                      hintStyle: TextStyle(
                                        color: Color(0xFF999999),
                                      ),
                                      border: InputBorder.none,
                                    ),
                                    onChanged: (value) {
                                      confirmPassword = value;
                                      signUpProvider.validationCheckConfirmPassword(confirmPassword);
                                    },
                                  ),
                                ),
                              );
                            }
                        ),
                        Consumer<SignUpValidation>(
                            builder: (context,signUpProvider,child) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 20, top: 4),
                                child: signUpProvider.confirmPasswordError != null
                                    ? Text(
                                  signUpProvider.confirmPasswordError!,
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 14,
                                  ),
                                )
                                    : SizedBox.shrink(),
                              );
                            }
                        ),

                        SizedBox(
                          height: 20,
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Transform.scale(
                                scale: 1.3,
                                child: Checkbox(
                                  value: _isChecked,
                                  activeColor: Color(0xFFD8C193),
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _isChecked = value!;
                                    });
                                  },),
                              ),

                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: RichText(text: TextSpan(
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'WixMadeRegular',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      children: [
                                        TextSpan(text: 'By creating an account you agree to our ', style: TextStyle(
                                          fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF999999)
                                        )),
                                        TextSpan(text: 'Terms & Conditions', style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                        )),
                                        TextSpan(text: ' & ' , style: TextStyle(
                                            color: Color(0xFF999999),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,

                                        )),
                                        TextSpan(text: 'Privacy Policy', style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,

                                        )),
                                      ]
                                  )),
                                ),
                              ),

                            ],
                          ),
                        ),

                        SizedBox(
                          height: 50,
                        ),

                        Consumer<SignUpValidation>(
                          builder: (context, signUpProvider, child) {
                            return Center(
                              child: GestureDetector(
                                onTap: () {
                                  signUpProvider.validationCheckPhone(phone);
                                  signUpProvider.validationCheckName(password);
                                  signUpProvider.validationCheckConfirmPassword(confirmPassword);
                                },
                                child: Container(
                                  width: 400,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFD8C193),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text("Create Account"
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

                        SizedBox(
                          height: 40,
                        ),

                        Center(
                          child: RichText(text: TextSpan(
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'WixMadeRegular',
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                              children: [
                                TextSpan(text: 'Already have an account', style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                )),
                                TextSpan(text: ' Sign in.', style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFD8C193),
                                ),
                                recognizer: TapGestureRecognizer()..onTap = (){
                                  FocusScope.of(context).requestFocus(FocusNode());
                                  Navigator.pushReplacementNamed(context, '/sign-in');
                                }
                                ),

                              ]
                          )),
                        ),
                        ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
