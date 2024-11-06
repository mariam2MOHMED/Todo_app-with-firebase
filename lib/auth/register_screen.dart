// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:todo_app/app_theme.dart';
// import 'package:todo_app/auth/login_screen.dart';
// import 'package:todo_app/components/dft_elevated_btn/dft_elevated_btn.dart';
// import 'package:todo_app/components/txt_field/text_field.dart';
// import 'package:todo_app/firebase_functions.dart';
// import 'package:todo_app/home_tab.dart';
// import 'package:todo_app/provider/user_provider.dart';
//
// class RegisterScreen extends StatefulWidget {
//   static String routeName="/RegisterScreen";
//   const RegisterScreen({super.key});
//
//   @override
//   State<RegisterScreen> createState() => _RegisterScreenState();
// }
//
// class _RegisterScreenState extends State<RegisterScreen> {
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
//               dftTxtField(hintTxt: "Enter your name",
//               validator: (value){
//             if(value==null||value.trim().length<3){
//           return "name must be greater than 3";
//             }else{
//               return null;
//             }
//               }, controller: namecontrll),
//               SizedBox(height: 16.0,),
//               dftTxtField(hintTxt: "Enter your E-mail",
//                   validator: (value){
//                     if(value==null||value.trim().length<7){
//                       return "e-mail must be greater than 3";
//                     }else{
//                       return null;
//                     }
//                   }, controller: emailcontrll),
//               SizedBox(height: 16.0,),
//               dftTxtField(
//                   isPassword: true,
//                   hintTxt: "Enter your Password",
//                   validator: (value){
//                     if(value==null||value.trim().length<7){
//                       return "Password must be greater than 3";
//                     }else{
//                       return null;
//                     }
//                   }, controller: passwordcontrll),
//               SizedBox(height: 24.0,),
//               dftElevatedBtn(label: "Create account", onPress: (){
//              register();
//               }),
//               SizedBox(height: 24.0,),
//               Row(
//                 children: [
//                   Text("Already have an account   ",
//                     style:Theme.of(context).textTheme.headlineMedium ,)
//              ,TextButton(
//                       style:TextButton.styleFrom(
//                         backgroundColor: AppTheme.blue,
//                         foregroundColor: AppTheme.white,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(0)
//                         )
//                       ) ,
//                       onPressed: (){
//                         Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
//                   }, child:
//              Text("Login",))
//                 ],
//               )
//
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// void register(){
//   if(formkey.currentState!.validate()){
//     FirebaseFunction.register(
//         name: namecontrll.text,
//         email: emailcontrll.text,
//         password: passwordcontrll.text).then((user) {
//       Provider.of<UserProvider>(context,listen: false).getUser(user);
//       Navigator.of(context).pushReplacementNamed(HomeTab.routeName);
//     }).catchError(
//             (e){
//           print("the error is $e");
//         });
//   }
// }
// }
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app_theme.dart';
import 'package:todo_app/auth/login_screen.dart';
import 'package:todo_app/components/dft_elevated_btn/dft_elevated_btn.dart';
import 'package:todo_app/components/txt_field/text_field.dart';
import 'package:todo_app/firebase_functions.dart';
import 'package:todo_app/home_tab.dart';
import 'package:todo_app/provider/user_provider.dart';

class RegisterScreen extends StatefulWidget {
  static String routeName="/RegisterScreen";
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var nameControll=TextEditingController();
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
              dftTxtField(hintTxt: 'Enter your name',
                  controller: nameControll, validator: (value){
                    if(value==null ||value.trim().isEmpty){
                      return "name must be not empty";
                    }else{
                      return null;
                    }
                  }),
              SizedBox(height: 20.0,),
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
              dftElevatedBtn(label: "Create Account", onPress: (){
register();
              }),
              SizedBox(height: 20.0,),
              InkWell(
                onTap: (){
Navigator.of(context).pushNamed(LoginScreen.routeName);
                },
                child: Text("Already Have an account",
                  style:Theme.of(context).textTheme.headlineMedium ,),
              )
            ],
          ),
        ),
      ),
    );
  }
  void register(){
    FirebaseFunction.register(name: nameControll.text,
        email: emailControll.text,
        password: passwordControll.text).then((user) {
Provider.of<UserProvider>(context,listen: false).getUser(user);
      Fluttertoast.showToast(msg: "user registered sucessfuly",
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