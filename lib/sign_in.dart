import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SignInValidation with ChangeNotifier{
  String? _phoneError;
  String? _passwordError;

  String? get phoneError => _phoneError;
  String? get passwordError => _passwordError;

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



}

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final _formKey = GlobalKey<FormState>();

  String? phone;
  String? password;
  String? confirmPassword;

  var _isObscure;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _isObscure = true;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignInValidation(),
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
            child: const Icon(
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
                  const Padding(
                    padding: EdgeInsets.only(top: 25, left: 18),
                    child: Text('Sign In',
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'WixMadeRegular',
                          fontWeight: FontWeight.w600,
                        )),
                  ),

                  // SizedBox(height: 12),

                  const Padding(
                    padding: EdgeInsets.only(left: 18),
                    child: Text('Let’s get into the app',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          fontFamily: 'WixMadeRegular',
                          color: Color(0xFF999999),
                        )),
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, bottom: 10),
                          child: RichText(text: const TextSpan(
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

                        Consumer<SignInValidation>(
                            builder: (context, signUpProvider, child) {
                              return Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: const Color(0xFFF8F8F8),
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
                                    decoration: const InputDecoration(
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
                        Consumer<SignInValidation>(
                            builder: (context,signUpProvider,child) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 20, top: 4),
                                child: signUpProvider.phoneError != null
                                    ? Text(
                                  signUpProvider.phoneError!,
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 14,
                                  ),
                                )
                                    : const SizedBox.shrink(),
                              );
                            }
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 20, bottom: 10, top: 15),
                          child: RichText(text: const TextSpan(
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

                        Consumer<SignInValidation>(
                            builder: (context, signUpProvider, child) {
                              return Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: const Color(0xFFF8F8F8),
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

                                    obscureText: _isObscure,
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    keyboardType: TextInputType.visiblePassword,
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        icon: _isObscure
                                            ? const Icon(Icons.visibility_outlined,color: Color(0xFF999999),)
                                            : const Icon(Icons.visibility_off,color: Color(0xFF999999),),
                                        onPressed: (){
                                          setState(() {
                                            _isObscure = !_isObscure;
                                          });
                                        },
                                      ),
                                      hintText: 'Enter Password',
                                      hintStyle: const TextStyle(
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
                        Consumer<SignInValidation>(
                            builder: (context,signUpProvider,child) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 20, top: 4),
                                child: signUpProvider.passwordError != null
                                    ? Text(
                                  signUpProvider.passwordError!,
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 14,
                                  ),
                                )
                                    : const SizedBox.shrink(),
                              );
                            }
                        ),


                        Padding(
                          padding: const EdgeInsets.only(right: 20,top: 10),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(context, '/forgot-password');
                            },
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              child: const Text("Forgot Password?",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontFamily: 'WixMadeRegular',
                                fontSize: 14,
                              ),),
                            ),
                          ),
                        ),


                        Consumer<SignInValidation>(
                            builder: (context, signUpProvider, child) {
                              return Center(
                                child: GestureDetector(
                                  onTap: () {
                                    signUpProvider.validationCheckPhone(phone);
                                    signUpProvider.validationCheckName(password);
                                  },
                                  child: Container(
                                    width: 400,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFD8C193),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Center(
                                      child: Text("Sign In"
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

                        const SizedBox(
                          height: 30,
                        ),

                        Center(
                          child: RichText(text: TextSpan(
                              style: const TextStyle(
                                color: Colors.black,
                                fontFamily: 'WixMadeRegular',
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                              children: [
                                const TextSpan(text: 'Already have an account', style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                )),
                                TextSpan(text: ' Sign up.', style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFD8C193),
                                ),
                                    recognizer: TapGestureRecognizer()..onTap = (){
                                      FocusScope.of(context).requestFocus(FocusNode());
                                      Navigator.pushReplacementNamed(context, '/sign-up');
                                    }
                                ),

                              ]
                          )),
                        ),

                        // Add TextFormFields and ElevatedButton here.
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