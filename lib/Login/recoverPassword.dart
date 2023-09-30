import 'package:flutter/material.dart';


import '../../utils/app_color.dart';
import '../utils/styles.dart';
import 'Login_Screen.dart';
import 'Reset a Password.dart';


class RecoverPassword extends StatefulWidget {
  const RecoverPassword({Key? key}) : super(key: key);

  @override
  State<RecoverPassword> createState() => _RecoverPasswordState();
}

class _RecoverPasswordState extends State<RecoverPassword> {
  final formKey = GlobalKey<FormState>();
  bool isChecked = false;
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: AppColors.bodycolor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.appbarcolor,
          leading:  IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 26,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          // title: Text(
          //   "",
          //   style: TextStyle(color: Colors.white),
          // ),
        ),
        body: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisSize: MainAxisSize.max,
          children: <Widget>[

            const Text(
              "Forgot Your Password",
              style: Styles.headingStyle,
              textAlign: TextAlign.center,
            ),

            SizedBox(
              height: 20,
            ),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: height*0.020,
                  ),
                  Text(
                    "Please enter your email address below. You will receive a link to reset your password.",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,

                      // fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    height: height*0.020,
                  ),

                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            children: [
                              Text(
                                "Email Address",
                                style: Styles.formfieldHeadingText,
                              ),
                              Text(
                                "*",
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),

                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'Example@gmail.com',
                            hintStyle: Styles.formfieldhintStyle,
                          ),
                          validator: (value) {
                            RegExp regex=RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                            if(value!.isEmpty){
                              return ("This is a required field.");
                            }
                            else if(!regex.hasMatch(value)){
                              return ("Enter valid email address");
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                      ],
                    ),
                  ),
                  SizedBox(
                    height: height*0.020,
                  ),
                  SizedBox(
                    height: height * 0.067,
                    width: width * 362,
                    child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: ElevatedButton(
                          onPressed: () {

                            if (formKey.currentState!.validate()) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const ResetPassword()));

                            }

                          },
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.buttoncolor, // background
                          ),

                          child: const Align(
                              child: Text(
                                "SEND RESET LINK",
                                style: TextStyle(
                                  fontFamily: 'NotoSans',
                                  fontSize: 20,
                                    color: AppColors.buttongrey,
                                    fontWeight: FontWeight.w700
                                ),
                              )),
                        )),
                  ),
                  SizedBox(
                    height: height*0.020,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                const LoginScreen()));
                      },
                      child: const Text(
                        'Back to Login',
                        style: TextStyle(
                          fontFamily: 'SourceSansPro',
                          fontSize: 16,
                          color: AppColors.underlineTextcolorheading,
                          // fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );

  }
}
