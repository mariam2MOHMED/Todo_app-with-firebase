// import 'dart:ui';
//
// import 'package:flutter/material.dart';
//
// class AppTheme{
//   static Color lightprimary=Color(0xFFDFECDB);
//   static Color darkprimary=Color(0xFF1E1E1E);
//   static Color green=Color(0xFF61E757);
//   static Color red=Color(0xFFEC4B4B);
//   static Color black=Color(0xFF200E32);
//   static Color white=Color(0xFFFFFFFF);
//   static Color blue=Color(0xFF5D9CEC);
//   static Color grey=Color(0xFFC8C9CB);
//   //141922
//   static Color darkgrey=Color(0xFF141922);
//
// static ThemeData lightTheme=ThemeData(
//   scaffoldBackgroundColor: lightprimary,
//   textTheme: TextTheme(
//     titleLarge: TextStyle(
//       fontSize: 22.0,
//       fontWeight: FontWeight.bold,
//       color: white
//     ),
//     headlineMedium: TextStyle(
//         fontSize: 18.0,
//         fontWeight: FontWeight.bold,
//         color: blue
//     ),
//     headlineSmall: TextStyle(
//         fontSize: 15.0,
//         fontWeight: FontWeight.bold,
//         color: black
//     ),
//   ),
//   bottomNavigationBarTheme: BottomNavigationBarThemeData(
//     backgroundColor: white,
// type: BottomNavigationBarType.fixed,
//     selectedItemColor: blue,
//     unselectedItemColor: grey,
//     showSelectedLabels: true,
//     showUnselectedLabels: false,
//   ),
//   floatingActionButtonTheme: FloatingActionButtonThemeData(
//     backgroundColor: blue,
//     foregroundColor: white,
//     shape: CircleBorder(
//       side: BorderSide(
//         color: white,
//         width: 4)), ),
//
// );
//   static ThemeData darkTheme=ThemeData(
//     scaffoldBackgroundColor: darkprimary,
//     textTheme: TextTheme(
//         titleLarge: TextStyle(
//             fontSize: 22.0,
//             fontWeight: FontWeight.bold,
//             color: darkprimary
//         ),
//       headlineMedium: TextStyle(
//           fontSize: 18.0,
//           fontWeight: FontWeight.bold,
//           color: blue
//       ),
//       headlineSmall: TextStyle(
//           fontSize: 15.0,
//           fontWeight: FontWeight.bold,
//           color: black
//       ),
//     ),
//     bottomNavigationBarTheme: BottomNavigationBarThemeData(
//       backgroundColor: darkgrey,
//       type: BottomNavigationBarType.fixed,
//       selectedItemColor: blue,
//       unselectedItemColor: white,
//       showSelectedLabels: true,
//       showUnselectedLabels: false,
//     ),
//     floatingActionButtonTheme: FloatingActionButtonThemeData(
//       backgroundColor: blue,
//       foregroundColor: white,
//       shape: CircleBorder(
//           side: BorderSide(
//               color: darkgrey,
//               width: 4)), ),
//
//   );
// }
import 'dart:ui';

import 'package:flutter/material.dart';

class AppTheme{
  static Color lightprimary=Color(0xFFDFECDB);
  static Color darkprimary=Color(0xFF060E1E);
  static Color white=Color(0xFFFFFFFF);
  static Color green=Color(0xFF61E757);
  static Color red=Color(0xFFEC4B4B);
  static Color grey=Color(0xFFC8C9CB);
  static Color black=Color(0xFF363636);
  static Color blue=Color(0xFF5D9CEC);
  //141922
  static Color containerdark=Color(0xFF141922);
  //141922
  static Color bottomdark=Color(0xFF141922);
static ThemeData lightTheme=ThemeData(
  textTheme: TextTheme(
    titleLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 22.0,
      color: white
    )  ,
    headlineMedium: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18.0,
      color: blue
  ),
  headlineSmall: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15.0,
      color: black
  ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(

    type: BottomNavigationBarType.fixed,
    backgroundColor: white,
    selectedItemColor: blue,
    unselectedItemColor: grey,
    showSelectedLabels: true,
    showUnselectedLabels: false,
  ),
  scaffoldBackgroundColor: lightprimary,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    shape: CircleBorder(
      side: BorderSide(
        color: white,
        width: 4.0
      )
    ),
    backgroundColor: blue,
    iconSize: 24.0,

  )
);
  static ThemeData darkTheme=ThemeData(
      textTheme: TextTheme(
          titleLarge: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22.0,
              color: darkprimary
          ),
        headlineMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
            color: blue
        ),
        headlineSmall: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
            color: white
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(

        type: BottomNavigationBarType.fixed,
        backgroundColor: bottomdark,
        selectedItemColor: blue,
        unselectedItemColor: white,
        showSelectedLabels: true,
        showUnselectedLabels: false,
      ),
      scaffoldBackgroundColor: darkprimary,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        shape: CircleBorder(
            side: BorderSide(
                color: bottomdark,
                width: 4.0
            )
        ),
        backgroundColor: blue,
        iconSize: 24.0,

      )
  );
}