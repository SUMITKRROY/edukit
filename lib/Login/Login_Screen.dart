
import 'package:edukit/Login/recoverPassword.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:shared_preferences/shared_preferences.dart';



import '../homePage.dart';
import '../utils/Utils.dart';
import '../utils/app_color.dart';
import '../utils/styles.dart';

import 'Create an Account.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool passwordVisible = false;
  final _Email = TextEditingController();
  TextEditingController _password= TextEditingController();

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }
  // @override
  // void dispose() {
  //   super.dispose();
  //   removeValues();
  // }

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
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 26,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[

              Text(
                "Login ",
                style:  Styles.headingStyle,
                textAlign: TextAlign.center,

              ),
              SizedBox(
                height: height * 0.040,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          FutureBuilder<SharedPreferences>(
                            future: SharedPreferences.getInstance(),
                            builder: (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
                              SharedPreferences prefs = snapshot.data!;
                              String firstName = prefs.getString('firstName') ?? '';
                              String lastName = prefs.getString('lastName') ?? '';
                              String password = prefs.getString('password') ?? '';
                              String email = prefs.getString('email') ?? '';
                              return Column(
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
                                  SizedBox(
                                    height: height * 0.010,
                                  ),
                                  TextFormField(
                                    controller: _Email,
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      hintText: 'Example@gmail.com',
                                      hintStyle: Styles.formfieldhintStyle,
                                    ),
                                    validator: (value) {
                                      RegExp regex=RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                                      if(value!.isEmpty){
                                        return ("Email is required");
                                      }
                                      else if(!regex.hasMatch(value)){
                                        return ("Invalid email address");
                                      }  else if (email != null && value != email) {
                                         return 'Please enter the correct email address';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: height * 0.020,
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Row(
                                      children: [
                                        Text("Password",
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
                                  SizedBox(
                                    height: height * 0.010,
                                  ),
                                  TextFormField(
                                    controller: _password,
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    inputFormatters: <TextInputFormatter>[
                                      LengthLimitingTextInputFormatter(10),
                                      // FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+'))
                                    ],
                                    keyboardType: TextInputType.text,
                                    obscureText: passwordVisible,
                                    decoration: InputDecoration(
                                      hintText: 'XXXXXXXXXXX',
                                      hintStyle: Styles.formfieldhintStyle,
                                      suffixIcon: IconButton(
                                        color: Colors.grey,
                                        icon: Icon(passwordVisible
                                            ? Icons.visibility_off
                                            : Icons.visibility),
                                        onPressed: () {
                                          setState(
                                                () {
                                              passwordVisible = !passwordVisible;
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Invalid password.';
                                      } else if (password != null && value != password) {
                                        return 'Please enter the correct password';
                                      }
                                      return null;
                                    },
                                    /*   validator: (value) {
                              RegExp regex=RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                              if(value!.isEmpty){
                                return ("Password is required");
                              }
                              else if(value.length<8){
                                return ("Password must be more than 7 characters");
                              }
                              else if(!regex.hasMatch(value)){
                                return ("Password should contain upper,lower,digit and special character ");
                              }
                              return null;
                            },*/
                                  ),
                                ],
                              );
                            },
                          ),

                        ],
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: height * 0.050,
                        ),
                        Container(
                          // color: Colors.grey,
                          height: height * 0.033,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              child: Container(
                                child: Text(
                                  'Recover Password ?',
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 16,
                                      color: AppColors.underlineTextcolorheading,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        const RecoverPassword()));
                              },
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          // color: Colors.grey,
                          // height: 33,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              child: Container(
                                child: Text(
                                  'Create new Account',
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 16,
                                      color: AppColors.underlineTextcolorheading,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        const CreateNewAccount()));
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.030,
                    ),
                    SizedBox(
                      // height: 67,
                      // width: 362,
                      height: height * 0.067,
                      width: width * 362,
                      child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                Utils.checkLogin = true;
                              });


                              if (formKey.currentState!.validate()) {


                                SharedPreferences prefs = await SharedPreferences.getInstance();
                                prefs.setBool('isLoggedIn', true);


                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        const Homepage()),
                                        (Route<dynamic> route) => false);

                              }


                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.buttoncolor, // background
                            ),

                            child: const Align(
                                child: Text(
                                  "LOGIN",
                                  style: TextStyle(
                                      fontFamily: 'NotoSans',
                                      fontSize: 18,
                                      color: AppColors.buttongrey,
                                      fontWeight: FontWeight.w700),
                                )),
                          )),
                    ),


                  ],
                ),
              ),
              // SizedBox(height: height*0.00,),
            ],
          ),
        ),
      ),
    );

  }

}
