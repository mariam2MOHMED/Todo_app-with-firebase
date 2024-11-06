// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:provider/provider.dart';
// import 'package:todo_app/app_theme.dart';
// import 'package:todo_app/components/dft_elevated_btn/dft_elevated_btn.dart';
// import 'package:todo_app/components/txt_field/text_field.dart';
// import 'package:todo_app/firebase_functions.dart';
// import 'package:todo_app/home_tab.dart';
// import 'package:todo_app/provider/user_provider.dart';
//
// class LoginScreen extends StatefulWidget {
//   static String routeName="/LoginScreen";
//   const LoginScreen({super.key});
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   var namecontrll=TextEditingController();
//   var emailcontrll=TextEditingController();
//   var passwordcontrll=TextEditingController();
//   var formkey=GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: Form(
//         key: formkey,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               txtField(txt: "Enter your E-mail",
//                   validator: (value){
//                     if(value==null||value.trim().length<7){
//                       return "e-mail must be greater than 3";
//                     }else{
//                       return null;
//                     }
//                   }, controller: emailcontrll),
//               SizedBox(height: 16.0,),
//               txtField(
//                   isPassword: true,
//                   txt: "Enter your Password",
//                   validator: (value){
//                     if(value==null||value.trim().length<7){
//                       return "Password must be greater than 3";
//                     }else{
//                       return null;
//                     }
//                   }, controller: passwordcontrll),
//               SizedBox(height: 24.0,),
//               dftElevatedBtn(txt: "Login", onpress: (){
//                 login();
//
//               }),
//
//
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//   void login(){
//     if(formkey.currentState!.validate()){
//       FirebaseFunction.login(email: emailcontrll.text,
//           password: passwordcontrll.text).then((user) {
// Provider.of<UserProvider>(context,listen: false).updateUser(user);
// Navigator.of(context).pushReplacementNamed(HomeTab.routeName);
//       }).catchError(
//               (error){
// String? message;
//                 if(error is FirebaseAuthException){
// message=error.message;
//                 }else{
//                   Fluttertoast.showToast(
//                       msg: message??"some thing went wrong",
//                       backgroundColor: AppTheme.red,
//                       fontSize: 20.0,
//                       textColor: AppTheme.white,
//                       toastLength: Toast.LENGTH_LONG,
//                       timeInSecForIosWeb: 5
//                   );
//                 }
//               });
//     }
//   }
// }
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app_theme.dart';
import 'package:todo_app/firebase_functions.dart';
import 'package:todo_app/home_tab.dart';

import '../components/dft_elevated_btn/dft_elevated_btn.dart';
import '../components/txt_field/text_field.dart';
import '../provider/user_provider.dart';

class LoginScreen extends StatefulWidget {
  static String routeName="/LoginScreen";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailControll=TextEditingController();
  var passwordControll=TextEditingController();
  var formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              dftTxtField(hintTxt: 'Enter email',
                  controller: emailControll, validator: (value){
                    if(value==null ||value.trim().isEmpty){
                      return "email must be not empty";
                    }else{
                      return null;
                    }
                  }),
              SizedBox(height: 20.0,),
              dftTxtField(hintTxt: 'Enter a Password',
                controller: passwordControll, validator: (value){
                  if(value==null ||value.trim().isEmpty){
                    return "email must be not empty";
                  }else{
                    return null;
                  }
                },
                isPassword: true,
              ),
              SizedBox(height: 20.0,),
              dftElevatedBtn(label: "Login", onPress: (){
login();
              }),


            ],
          ),
        ),
      ),
    );
  }
  void login(){
    FirebaseFunction.login(
        email: emailControll.text,
        password: passwordControll.text).then((user) {
      Provider.of<UserProvider>(context,listen: false).getUser(user);
      Fluttertoast.showToast(msg: "user logined sucessfuly",
          backgroundColor: AppTheme.green,
          fontSize: 18.0,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 10,
          toastLength: Toast.LENGTH_LONG,
          textColor: AppTheme.white
      );
      Navigator.of(context).pushNamed(HomeTab.routeName);
    }).catchError((e){
      print("the error is $e");
    });
  }
}


