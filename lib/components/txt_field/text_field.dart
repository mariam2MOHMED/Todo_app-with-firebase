//
// import 'package:flutter/material.dart';
//
// class txtField extends StatefulWidget {
//   String txt;
//   String? Function(String?)? validator;
//   TextEditingController controller;
//   final bool isPassword;
//    txtField({
//     required this.txt,
//      required this.validator,
//      required this.controller,
//      this.isPassword=false
// });
//
//   @override
//   State<txtField> createState() => _txtFieldState();
// }
//
// class _txtFieldState extends State<txtField> {
//    bool isobscure=false;
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
// obscureText: isobscure,
// validator:widget.validator ,
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//       controller: widget.controller,
// decoration: InputDecoration(
//  hintText: widget.txt,
//   suffixIcon: widget.isPassword ==true?IconButton(
//     onPressed: (){
//       isobscure=!isobscure;
//       setState(() {
//
//       });
//     },
//     icon: isobscure==true?
//     Icon(Icons.visibility_off):
//     Icon(Icons.visibility),
//   ):null,
//
//   border: UnderlineInputBorder(),
//
// ),
//     );
//   }
// }
//
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app_theme.dart';
import 'package:todo_app/provider/setting_provider.dart';

class dftTxtField extends StatefulWidget {
  String hintTxt;
  TextEditingController controller;
  String? Function(String?)? validator;
  bool isPassword;
   dftTxtField({
    required this.hintTxt,
     required this.controller,
     required this.validator,
     this.isPassword=false,
});

  @override
  State<dftTxtField> createState() => _dftTxtFieldState();
}

class _dftTxtFieldState extends State<dftTxtField> {
  bool isobsecure=false;
  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider=Provider.of<SettingProvider>(context);
    return
      TextFormField(

      validator: widget.validator,
      controller: widget.controller,
   autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: isobsecure,
      style: TextStyle(
          color: settingProvider.themeMode==ThemeMode.dark?AppTheme.white:AppTheme.black
      ),
      decoration: InputDecoration(

  suffixIcon: widget.isPassword ==true?IconButton(
    onPressed: (){
      isobsecure=!isobsecure;
      setState(() {

      });
    },
    icon: isobsecure==true?
    Icon(Icons.visibility_off):
    Icon(Icons.visibility),
  ):null,

        border: UnderlineInputBorder( ),
   hintText:      widget.hintTxt,
hintStyle: TextStyle(
  color: settingProvider.themeMode==ThemeMode.dark?AppTheme.white:AppTheme.black
)
      ),
    );
  }
}

