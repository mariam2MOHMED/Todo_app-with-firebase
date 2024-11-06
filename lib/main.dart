import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app_theme.dart';
import 'package:todo_app/auth/login_screen.dart';
import 'package:todo_app/auth/register_screen.dart';
import 'package:todo_app/home_tab.dart';
import 'package:todo_app/provider/setting_provider.dart';
import 'package:todo_app/provider/task_provider.dart';
import 'package:todo_app/provider/user_provider.dart';
import 'package:todo_app/tabs/task/edit_task.dart';

import 'firebase_options.dart';

// Future<void> main()async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   await  FirebaseFirestore.instance.disableNetwork();
//
//   FirebaseFirestore.instance.settings.cacheSizeBytes;
//
//   runApp(ChangeNotifierProvider(create: (BuildContext context) =>
//   TaskProvider()..getAllTask(),
//   child: TodoApp()));
// }
//
// class TodoApp extends StatelessWidget {
//   const TodoApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       themeMode: ThemeMode.light,
//       theme: AppTheme.lightTheme,
//       routes: {
//         HomeTab.routeName:(_)=>HomeTab(),
//
//       },
//       initialRoute:HomeTab.routeName,
//     );
//   }
// }
Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // await  FirebaseFirestore.instance.disableNetwork();
  //
  // FirebaseFirestore.instance.settings.cacheSizeBytes;
  runApp(

 MultiProvider(providers: [
     ChangeNotifierProvider(create: (BuildContext context) =>
      TaskProvider()),
  ChangeNotifierProvider(create: (BuildContext context) =>
  UserProvider()),
   ChangeNotifierProvider(create: (BuildContext context) =>
       SettingProvider()..getTheme()),
 ],
 child: TodoApp()));
}
class TodoApp extends StatelessWidget {
   TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider=Provider.of<SettingProvider>(context);
    return MaterialApp(
debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      themeMode: settingProvider.themeMode,
      darkTheme: AppTheme.darkTheme,
      routes: {
  HomeTab.routeName:(_)=>HomeTab(),
        EditTask.routeName:(_)=>EditTask(),
        RegisterScreen.routeName:(_)=>RegisterScreen(),
        LoginScreen.routeName:(_)=>LoginScreen()
      },

      initialRoute:RegisterScreen.routeName,
    );
  }
}

