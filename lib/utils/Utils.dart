import 'dart:ui';


import 'package:edukit/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



import 'app_color.dart';

class Utils {
  static BuildContext? _loaderContext;
  static BuildContext? _loadingDialoContext;
  static bool _isLoaderShowing = false;
  static bool _isLoadingDialogShowing = false;
  static var checkLogin;
  static String userkey = '';
  static String indexname = '';
  static var Position;
  static String currencyName = '';
  static String currencySymbol = '';
  static String loaction = '';






  static Map<String, dynamic> categoriesList = {};
   static Map<String, dynamic> ProdRendInfoModel ={};
  static List< dynamic> sidemenulist = [];
  static List< dynamic> FilteredData = [];
  static List<dynamic> submenu =[];


  static List<dynamic> items =[];





  static void hideLoader() {
    if (_isLoaderShowing && _loaderContext != null) {
      Navigator.pop(_loaderContext!);
      _loaderContext = null;
    }
  }

  static void hideLoadingDialog() {
    if (_isLoadingDialogShowing && _loadingDialoContext != null) {
      Navigator.pop(_loadingDialoContext!);
      _loadingDialoContext = null;
    }
  }
  static void showPickerShipin(context,) {
    const dataItems = [
      'Ready to Ship',
      'Within 2 days',
      'Within 7 days',
      'Within 10 days',
      'Within 15 days',
      'More than 15 days',
    ];
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      context: context,
      builder: (BuildContext bc) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: SizedBox(
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                      width: 40,
                      child: Divider(
                        thickness: 3,
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  Text("SHIPS IN",
                      textScaleFactor: 1.0,
                      style: Styles.H1Headings15,
                      textAlign: TextAlign.start),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: dataItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            const Divider(
                              height: 1,
                            ),
                            InkWell(
                              child: Padding(
                                padding:
                                const EdgeInsets.symmetric(vertical: 15.0),
                                child: Container(
                                  child: Text(
                                    // 'Within 2 days',
                                      dataItems[index],
                                      textScaleFactor: 1.0,
                                      style: Styles.decStyle,
                                      textAlign: TextAlign.start),
                                ),
                              ),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }




  static void ShowDialoglogin(BuildContext context, String message) {
    // Timer? timer = Timer(const Duration(milliseconds: 3000), (){
    //   Navigator.of(context, rootNavigator: true).pop();
    // });
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Dialog(
            child: Container(
              height: 300,
              width: 250,
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    // padding: const EdgeInsets.all(20.0),
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        "images/welcome_icon.png",
                        height: 55,
                        width: 60,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Utsav Fashion",
                    style: Styles.headingStyle,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    message,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          height: 40,
                          width: 100,
                          child: ElevatedButton(
                            child: Text(
                              "OK",
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 12,
// color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            onPressed: () {
// (Route<dynamic> route) => false);
                             /* Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const loginScreen()));*/
                            },
                            style: ElevatedButton.styleFrom(
                              primary: AppColors.primaryColorpink, // background
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          height: 40,
                          width: 100,
                          child: ElevatedButton(
                            child: Text(
                              "Cancel".toUpperCase(),
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 12,
// color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            onPressed: () {
// (Route<dynamic> route) => false);
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: AppColors.primaryColorpink, // background
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
    /*showDialog(
        context: context,
        builder: (BuildContext context) {
          return  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(  // Bottom rectangular box
                    margin: EdgeInsets.only(top: 40), // to push the box half way below circle
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.only(top: 60, left: 20, right: 20), // spacing inside the box
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          message,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        SizedBox(
                          height: 16,
                        ),

                      ],
                    ),
                  ),
                  Positioned(
                    top: 5,
                    child: CircleAvatar( // Top Circle with icon
                      maxRadius: 40.0,
                      backgroundColor: Colors.white,
                      child: Image.asset('images/japanlogo.png'),
                    ),
                  ),
                ],
              ),
            ],
          );
        }
           ).then((value){
      // dispose the timer in case something else has triggered the dismiss.
      timer?.cancel();
      timer = null;
    });*/
  }

  static void ShowDialogAssitens(BuildContext context, String message) {
    // Timer? timer = Timer(const Duration(milliseconds: 3000), (){
    //   Navigator.of(context, rootNavigator: true).pop();
    // });
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Dialog(
            child: Container(
              height: 300,
              width: 250,
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "I am Yet",
                    style: Styles.headingStyle,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    message,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          height: 40,
                          width: 100,
                          child: ElevatedButton(
                            child: Text(
                              "OK",
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 12,
// color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            onPressed: () {
// (Route<dynamic> route) => false);
                         /*     Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const loginScreen()));*/
                            },
                            style: ElevatedButton.styleFrom(
                              primary: AppColors.primaryColorpink, // background
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          height: 40,
                          width: 100,
                          child: ElevatedButton(
                            child: Text(
                              "Cancel".toUpperCase(),
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 12,
// color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            onPressed: () {
// (Route<dynamic> route) => false);
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: AppColors.primaryColorpink, // background
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
    /*showDialog(
        context: context,
        builder: (BuildContext context) {
          return  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(  // Bottom rectangular box
                    margin: EdgeInsets.only(top: 40), // to push the box half way below circle
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.only(top: 60, left: 20, right: 20), // spacing inside the box
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          message,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        SizedBox(
                          height: 16,
                        ),

                      ],
                    ),
                  ),
                  Positioned(
                    top: 5,
                    child: CircleAvatar( // Top Circle with icon
                      maxRadius: 40.0,
                      backgroundColor: Colors.white,
                      child: Image.asset('images/japanlogo.png'),
                    ),
                  ),
                ],
              ),
            ],
          );
        }
           ).then((value){
      // dispose the timer in case something else has triggered the dismiss.
      timer?.cancel();
      timer = null;
    });*/
  }

  static void ShowDialogoption(BuildContext context, String message) {
    // Timer? timer = Timer(const Duration(milliseconds: 3000), (){
    //   Navigator.of(context, rootNavigator: true).pop();
    // });
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Dialog(
            child: Container(
              height: 300,
              width: 250,
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    // padding: const EdgeInsets.all(20.0),
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        "images/welcome_icon.png",
                        height: 55,
                        width: 60,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Utsav Fashion",
                    style: Styles.headingStyle,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    message,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          height: 40,
                          width: 100,
                          child: ElevatedButton(
                            child: Text(
                              "OK",
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 12,
// color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            onPressed: () {
// (Route<dynamic> route) => false);
                             /* Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const loginScreen()));*/
                            },
                            style: ElevatedButton.styleFrom(
                              primary: AppColors.primaryColorpink, // background
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          height: 40,
                          width: 100,
                          child: ElevatedButton(
                            child: Text(
                              "Cancel".toUpperCase(),
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 12,
// color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            onPressed: () {
// (Route<dynamic> route) => false);
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: AppColors.primaryColorpink, // background
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

  }

  static void showPickerBottom(context, img) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        context: context,
        builder: (BuildContext bc) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: SizedBox(
                height: height / 2,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Align(
                            child: Container(
                              height: 5,
                              width: 30,
                              margin: const EdgeInsets.only(
                                  top: 10, left: 10, right: 10),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                // border: Border.all(color: Colors.grey, width: 0.0),
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(100, 50)),
                              ),
                              child: const Text(''),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      const Text('SIMILAR PRODUCT',
                          textScaleFactor: 1.0,
                          style: Styles.decStyle,
                          textAlign: TextAlign.start),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: height * 0.300,
                          child: ListView.builder(
                            itemCount: 5,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                 /* if (Utils.checkLogin == true) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SoldPrdWithLogin(img: img)));
                                  } else {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SoldPrdWtLogin(img: img)));
                                  }*/
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         // builder: (context) => ConceptPage( )));
                                  //         builder: (context) =>
                                  //             ProductDetailsScreen(img: img)));
                                },
                                child: Card(
                                  color: Colors.white,
                                  shape: const RoundedRectangleBorder(
                                    // borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  elevation: 0,
                                  child: Column(
                                    children: [
                                      img.contains("https")
                                          ? Image.network(
                                        img,
                                        fit: BoxFit.fill,
                                        height: height / 3.1,
                                        width: width / 2,
                                      )
                                          : Image.asset(
                                        img,
                                        fit: BoxFit.fill,
                                        height: height / 3.1,
                                        width: width / 2,
                                      ),
                                      // Image.asset(
                                      //
                                      //   img,
                                      //   fit: BoxFit.cover,
                                      //   height: height / 3.1,
                                      //   width: width / 2,
                                      // ),
                                      Container(
                                        // color: Colors.red,
                                        width: width / 2,
                                        padding:
                                        EdgeInsets.symmetric(horizontal: 0),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              Utils.items[index]['name'],
                                              textAlign: TextAlign.start,
                                              style:
                                              Styles.decStyle,
                                            ),
                                            Text.rich(
                                              TextSpan(
                                                text: '',
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: '₹5000.00',
                                                    style:
                                                    Styles.prizeStyle5,
                                                  ),
                                                  TextSpan(
                                                    text: Utils.currencySymbol + Utils.items[index]
                                                    ['price_info'][
                                                    'minimal_regular_price']
                                                        .toString(),
                                                    style:
                                                    Styles.prizeStyle3,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  // margin: EdgeInsets.all(10),
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    ]),
              ),
            ),
          );
        });
  }

}
class Widgets{
  Widgets._();
  static ksizedBox(context) => SizedBox(
    height:  20,
  );
  static ksizedBox15(context) => SizedBox(
    height:  15,
  );
  static ksizedBox10(context) => SizedBox(
    height:  10,
  );
  static ksizedBox5(context) => SizedBox(
    height:  5,
  );

  static kheadinghome(context, heading) => Align(
    alignment: Alignment.centerLeft,
    child: Text(
      heading,
      style: Styles.khomeheadingStyle,
    ),
  );



  static void ShowDialoglogin(BuildContext context, String message) {
    // Timer? timer = Timer(const Duration(milliseconds: 3000), (){
    //   Navigator.of(context, rootNavigator: true).pop();
    // });
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Dialog(
            child: Container(
              height: 300,
              width: 250,
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    // padding: const EdgeInsets.all(20.0),
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        "images/welcome_icon.png",
                        height: 55,
                        width: 60,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Utsav Fashion",
                    style: Styles.headingStyle,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    message,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          height: 40,
                          width: 100,
                          child: ElevatedButton(
                            child: Text(
                              "OK",
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 12,
// color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            onPressed: () {
// (Route<dynamic> route) => false);
                          /*    Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const loginScreen()));*/
                            },
                            style: ElevatedButton.styleFrom(
                              primary: AppColors.primaryColorpink, // background
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          height: 40,
                          width: 100,
                          child: ElevatedButton(
                            child: Text(
                              "Cancel".toUpperCase(),
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 12,
// color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            onPressed: () {
// (Route<dynamic> route) => false);
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: AppColors.primaryColorpink, // background
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
    /*showDialog(
        context: context,
        builder: (BuildContext context) {
          return  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(  // Bottom rectangular box
                    margin: EdgeInsets.only(top: 40), // to push the box half way below circle
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.only(top: 60, left: 20, right: 20), // spacing inside the box
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          message,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        SizedBox(
                          height: 16,
                        ),

                      ],
                    ),
                  ),
                  Positioned(
                    top: 5,
                    child: CircleAvatar( // Top Circle with icon
                      maxRadius: 40.0,
                      backgroundColor: Colors.white,
                      child: Image.asset('images/japanlogo.png'),
                    ),
                  ),
                ],
              ),
            ],
          );
        }
           ).then((value){
      // dispose the timer in case something else has triggered the dismiss.
      timer?.cancel();
      timer = null;
    });*/
  }

  static void ShowDialogAssitens(BuildContext context, String message) {
    // Timer? timer = Timer(const Duration(milliseconds: 3000), (){
    //   Navigator.of(context, rootNavigator: true).pop();
    // });
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Dialog(
            child: Container(
              height: 300,
              width: 250,
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "I am Yet",
                    style: Styles.headingStyle,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    message,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          height: 40,
                          width: 100,
                          child: ElevatedButton(
                            child: Text(
                              "OK",
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 12,
// color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            onPressed: () {
// (Route<dynamic> route) => false);
                            /*  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const loginScreen()));*/
                            },
                            style: ElevatedButton.styleFrom(
                              primary: AppColors.primaryColorpink, // background
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          height: 40,
                          width: 100,
                          child: ElevatedButton(
                            child: Text(
                              "Cancel".toUpperCase(),
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 12,
// color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            onPressed: () {
// (Route<dynamic> route) => false);
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: AppColors.primaryColorpink, // background
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
    /*showDialog(
        context: context,
        builder: (BuildContext context) {
          return  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(  // Bottom rectangular box
                    margin: EdgeInsets.only(top: 40), // to push the box half way below circle
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.only(top: 60, left: 20, right: 20), // spacing inside the box
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          message,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        SizedBox(
                          height: 16,
                        ),

                      ],
                    ),
                  ),
                  Positioned(
                    top: 5,
                    child: CircleAvatar( // Top Circle with icon
                      maxRadius: 40.0,
                      backgroundColor: Colors.white,
                      child: Image.asset('images/japanlogo.png'),
                    ),
                  ),
                ],
              ),
            ],
          );
        }
           ).then((value){
      // dispose the timer in case something else has triggered the dismiss.
      timer?.cancel();
      timer = null;
    });*/
  }

  static void ShowDialogoption(BuildContext context, String message) {
    // Timer? timer = Timer(const Duration(milliseconds: 3000), (){
    //   Navigator.of(context, rootNavigator: true).pop();
    // });
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Dialog(
            child: Container(
              height: 300,
              width: 250,
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    // padding: const EdgeInsets.all(20.0),
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        "images/welcome_icon.png",
                        height: 55,
                        width: 60,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Utsav Fashion",
                    style: Styles.headingStyle,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    message,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          height: 40,
                          width: 100,
                          child: ElevatedButton(
                            child: Text(
                              "OK",
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 12,
// color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            onPressed: () {
// (Route<dynamic> route) => false);
                              /*Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const loginScreen()));*/
                            },
                            style: ElevatedButton.styleFrom(
                              primary: AppColors.primaryColorpink, // background
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          height: 40,
                          width: 100,
                          child: ElevatedButton(
                            child: Text(
                              "Cancel".toUpperCase(),
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 12,
// color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            onPressed: () {
// (Route<dynamic> route) => false);
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: AppColors.primaryColorpink, // background
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
    /*showDialog(
        context: context,
        builder: (BuildContext context) {
          return  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(  // Bottom rectangular box
                    margin: EdgeInsets.only(top: 40), // to push the box half way below circle
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.only(top: 60, left: 20, right: 20), // spacing inside the box
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          message,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        SizedBox(
                          height: 16,
                        ),

                      ],
                    ),
                  ),
                  Positioned(
                    top: 5,
                    child: CircleAvatar( // Top Circle with icon
                      maxRadius: 40.0,
                      backgroundColor: Colors.white,
                      child: Image.asset('images/japanlogo.png'),
                    ),
                  ),
                ],
              ),
            ],
          );
        }
           ).then((value){
      // dispose the timer in case something else has triggered the dismiss.
      timer?.cancel();
      timer = null;
    });*/
  }
}
class Constants {
  Constants._();

  static const login = "Login";
  static const forgot_password = "Forgot\nPassword";
  static const demo_mail =
      "Dear John Smith\n\nThank you for visiting AVK company during the above trade show in Germany.\n\nYou have shown interest in the following producyts:\n\nCommercial products\nDomestic products\n\nYou can read, download and view all\nproduct information according to the below links:";
  static const sub_heading_forgot_password =
      "Enter your email and we'll send you a one time password by email";
  static const error_login_credentials = "Username or password is incorrect";

  //edittext labels
  static const email = "Email";
  static const password = "Password";
  static const confirm_password = "Confirm Password";
  static const search = "Search";

  //edit text hints
  static const enterEmail = "Enter email";
  static const enterPassword = "Enter password";
  static const enterConfirmPassword = "Enter confirm password";
  static const searchHint = "search";
  static const name = "Name";
  static const title = "Title";
  static const phone = "Phone";
  static const address = "Address";
  static const zipcode = "zipcode";
  static const City = "City";
  static const company = "Company";
  static const country = "Country";
  static const Website = "Website";
  static const Permissiondate = "Permission date";
  static const Pleaseentervalidname = "Please enter a valid name";
  static const PleaseentervalidEmail = "Please enter a valid email address";
  static const Pleaseentervalidoption = "Please select an option";
}