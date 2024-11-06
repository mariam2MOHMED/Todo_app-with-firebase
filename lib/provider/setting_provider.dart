import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingProvider with ChangeNotifier{
ThemeMode themeMode=ThemeMode.dark;

Future<void>getTheme()async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? isDark=  await prefs.getBool("isDark");
  if(isDark!=null){
if(isDark==true){
  themeMode=ThemeMode.dark;
}else{
  themeMode=ThemeMode.light;
}
  }
  notifyListeners();
}
Future<void>changeTheme(ThemeMode currtheme)async{
  themeMode=currtheme;
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool("isDark", themeMode==ThemeMode.dark);
 notifyListeners();
}
}