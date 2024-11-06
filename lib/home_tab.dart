
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:todo_app/components/bottom_sheet/taskBottomSheet.dart';
// import 'package:todo_app/provider/task_provider.dart';
// import 'package:todo_app/tabs/setting/setting.dart';
// import 'package:todo_app/tabs/task/task.dart';
//
// class HomeTab extends StatefulWidget {
//   static String routeName="/HomeTab";
//   const HomeTab({super.key});
//
//   @override
//   State<HomeTab> createState() => _HomeTabState();
// }
//
// class _HomeTabState extends State<HomeTab> {
//   int currindex=0;
//   List<Widget>tabs=[
//     TaskTab(),
//     SettingTab(),
//
//   ];
//   @override
//   Widget build(BuildContext context) {
//     TaskProvider taskProvider=Provider.of<TaskProvider>(context);
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: tabs[currindex],
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       floatingActionButton: FloatingActionButton(
//
//         onPressed: (){
//           showModalBottomSheet(context: context, builder: (context)=>
//               TaskBottomheet());
//         },
//         child:Icon(
//           Icons.add
//         ) ,
//       ),
//       bottomNavigationBar: BottomAppBar(
//         notchMargin: 10,
//         shape: CircularNotchedRectangle(),
//         padding: EdgeInsets.zero,
//         clipBehavior: Clip.antiAliasWithSaveLayer,
//         child: BottomNavigationBar(
//           currentIndex: currindex,
//           onTap: (index){
//             currindex=index;
//             setState(() {
//
//             });
//           },
//           items: [
//             BottomNavigationBarItem(icon: Icon(Icons.menu),label: 'Task'),
//             BottomNavigationBarItem(icon: Icon(Icons.settings),
//                 label: 'Settings'),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
import 'package:flutter/material.dart';
import 'package:todo_app/app_theme.dart';
import 'package:todo_app/components/bottom_sheet/taskBottomSheet.dart';
import 'package:todo_app/tabs/setting/setting.dart';
import 'package:todo_app/tabs/task/task.dart';

class HomeTab extends StatefulWidget {
  static String routeName="/HomeTab";
   HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int currindex=0;
  List<Widget>tabs=[
    TaskTab(),
    SettingTab()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: tabs[currindex],
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(

        onPressed: (){
          showModalBottomSheet(
            isScrollControlled: true,
              context: context, builder: (context)=>
              TaskBottomSheet());
        },
        child: Icon(
          Icons.add,
          color: AppTheme.white,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        padding: EdgeInsets.zero,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: BottomNavigationBar(
          currentIndex: currindex,
          onTap: (index){
            currindex=index;
            setState(() {

            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.menu),label: 'Tasks'),
            BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Setting'),
          ],
        ),
      ),
    );
  }
}
