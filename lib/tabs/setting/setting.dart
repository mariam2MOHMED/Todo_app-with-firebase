import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app_theme.dart';
import 'package:todo_app/auth/login_screen.dart';
import 'package:todo_app/firebase_functions.dart';
import 'package:todo_app/provider/setting_provider.dart';
import 'package:todo_app/provider/task_provider.dart';
import 'package:todo_app/provider/user_provider.dart';

class SettingTab extends StatelessWidget {
  const SettingTab({super.key});

  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider=Provider.of<SettingProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Text("Theme Mode",style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0
              )),
              Spacer(),
              Switch(
                  inactiveTrackColor:settingProvider.themeMode==ThemeMode.dark?
                  AppTheme.white:
                  AppTheme.blue,
                  activeTrackColor: Colors.grey,
                  activeColor: settingProvider.themeMode==ThemeMode.dark?
                  AppTheme.white:
                  AppTheme.blue,
                  value: settingProvider.themeMode==ThemeMode.dark,
                  onChanged: (isDark){
                settingProvider.changeTheme(isDark==true?ThemeMode.dark:ThemeMode.light);
                  })
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          Row(
            children: [
              Text("Log Out",style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 24.0
              )),
              Spacer(),
              IconButton(onPressed: (){
FirebaseFunction.signOut();
Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);

Provider.of<TaskProvider>(context,listen: false).tasks.clear();
Provider.of<UserProvider>(context,listen: false).getUser(null!!);


              }, icon: Icon(
                color: settingProvider.themeMode==ThemeMode.dark?
                AppTheme.white:
                AppTheme.blue,
                Icons.logout_outlined,
                size: 32.0,
              )),


            ],
          ),
        ],
      ),
    );
  }
}