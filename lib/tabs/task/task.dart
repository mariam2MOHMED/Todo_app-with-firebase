
// import 'package:easy_date_timeline/easy_date_timeline.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:provider/provider.dart';
// import 'package:todo_app/app_theme.dart';
// import 'package:todo_app/components/task_item/task_item.dart';
// import 'package:todo_app/provider/task_provider.dart';
// import 'package:todo_app/provider/user_provider.dart';
//
// class TaskTab extends StatefulWidget {
//   const TaskTab({super.key});
//
//   @override
//   State<TaskTab> createState() => _TaskTabState();
// }
//
// class _TaskTabState extends State<TaskTab> {
//   bool shouldgetTask=true;
//   @override
//   Widget build(BuildContext context) {
//
//     final userid=Provider.of<UserProvider>(context,listen: false).userModel!.id;
//     TaskProvider taskProvider=Provider.of<TaskProvider>(context);
//
//     if(shouldgetTask){
//
//       taskProvider.getAllTask(userid);
//       shouldgetTask=false;setState(() {
//
//       });
//     }
//     return Column(
//       children: [
//         Stack(
//           children: [
//             Container(
//               width: MediaQuery.of(context).size.width,
//               height:MediaQuery.of(context).size.height*0.15,
//               color: AppTheme.blue,
//             ),
//             PositionedDirectional(
//                 top: 45.0,
//                 start: 30.0,
//                 child: Text("TodoList",style:
//                 Theme.of(context).textTheme.titleLarge,)),
//             Padding(
//               padding:  EdgeInsets.only(
//                 top: MediaQuery.of(context).size.height*0.1,
//
//
//               ),
//               child: EasyInfiniteDateTimeLine(
//                 showTimelineHeader: false,
//                 dayProps: EasyDayProps(
//
//                   width: 60.0,
//                   height: 90.0,
//
//                   dayStructure: DayStructure.dayNumDayStr,
//                   activeDayStyle: DayStyle(
//                     decoration: BoxDecoration(
//                         color: AppTheme.white,
//                         borderRadius: BorderRadius.circular(5)
//                     ),
//                     dayStrStyle: TextStyle(
//                         fontSize: 15.0,
//                         fontWeight: FontWeight.bold,
//                         color: AppTheme.blue
//                     ),
//                     dayNumStyle: TextStyle(
//                         fontSize: 15.0,
//                         fontWeight: FontWeight.bold,
//                         color: AppTheme.blue
//                     ),
//                   ),
//                   inactiveDayStyle: DayStyle(
//                     decoration: BoxDecoration(
//                         color: AppTheme.white,
//                         borderRadius: BorderRadius.circular(5)
//                     ),
//                     dayStrStyle: TextStyle(
//                         fontSize: 15.0,
//                         fontWeight: FontWeight.bold,
//                         color: AppTheme.black
//                     ),
//                     dayNumStyle: TextStyle(
//                         fontSize: 15.0,
//                         fontWeight: FontWeight.bold,
//                         color: AppTheme.black
//                     ),
//                   ),
//
//                 ),
//                 firstDate: DateTime.now().subtract(
//                     Duration(days: 30)
//                 ),
//                 focusDate: taskProvider.selectTime,
//                 onDateChange: (dateTime){
//                   taskProvider.changeDate(dateTime);
//                   taskProvider.getAllTask(userid);
//                 },
//                 lastDate: DateTime.now().add(
//                     Duration(days: 30)),
//               ),
//             ),
//           ],
//         ),
//
//         Expanded(
//           child: ListView.separated(itemBuilder: (context,index){
//             return TaskItem(
//               taskModel: taskProvider.tasks[index],
//             );
//           },
//               separatorBuilder: (context,index){
//                 return SizedBox(height: 10.0,);
//               },
//               itemCount: taskProvider.tasks.length),
//         )
//       ],
//     );
//   }
// }

import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app_theme.dart';
import 'package:todo_app/components/task_item/task_item.dart';
import 'package:todo_app/provider/task_provider.dart';

import '../../provider/setting_provider.dart';
import '../../provider/user_provider.dart';

class TaskTab extends StatefulWidget {
  const TaskTab({super.key});

  @override
  State<TaskTab> createState() => _TaskTabState();
}

class _TaskTabState extends State<TaskTab> {
  bool shouldgetTask=true;
  @override
  Widget build(BuildContext context) {
    final userid=Provider.of<UserProvider>(context,listen: false).userModel!.id;
    TaskProvider taskProvider=Provider.of<TaskProvider>(context);
    SettingProvider settingProvider=Provider.of<SettingProvider>(context);
    if(shouldgetTask){

      taskProvider.getAllTask(userid);
      shouldgetTask=false;setState(() {

      });
    }
    return Column(

      children: [
        Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.16,
              color: AppTheme.blue,
            ),
            PositionedDirectional(
                start: 30.0,
                top: 40.0,
                child: Text("TodoList",
                  style: Theme.of(context).textTheme.titleLarge,)),
            Padding(
              padding:  EdgeInsets.only(top:
              MediaQuery.of(context).size.height*0.11 ),
              child: EasyInfiniteDateTimeLine(
                showTimelineHeader: false,
                dayProps: EasyDayProps(
                  width: 60,
                  height: 90,
                  dayStructure: DayStructure.dayNumDayStr,
                  todayStyle: DayStyle(
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(5),
    color: settingProvider.themeMode==ThemeMode.dark?
    AppTheme.containerdark.withOpacity(0.8)
        :AppTheme.white
    ),
    dayStrStyle: TextStyle(
    color: settingProvider.themeMode==ThemeMode.dark?AppTheme.white:AppTheme.black,
    fontSize: 15.0,
    fontWeight: FontWeight.bold
    ),
    dayNumStyle:TextStyle(
    color: settingProvider.themeMode==ThemeMode.dark?AppTheme.white:AppTheme.black,
    fontSize: 15.0,
    fontWeight: FontWeight.bold
    ),
    ),
                  activeDayStyle: DayStyle(

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                        color: settingProvider.themeMode==ThemeMode.dark?
                        AppTheme.containerdark.withOpacity(0.95)
                            :AppTheme.white
                    ),
                    dayStrStyle: TextStyle(
                      color: AppTheme.blue,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold
                    ),
                    dayNumStyle:TextStyle(
                        color: AppTheme.blue,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  inactiveDayStyle: DayStyle(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                        color: settingProvider.themeMode==ThemeMode.dark?
                        AppTheme.containerdark.withOpacity(0.8)
                            :AppTheme.white
                    ),
                    dayStrStyle: TextStyle(
                        color: settingProvider.themeMode==ThemeMode.dark?AppTheme.white:AppTheme.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold
                    ),
                    dayNumStyle:TextStyle(
                        color: settingProvider.themeMode==ThemeMode.dark?AppTheme.white:AppTheme.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              firstDate: DateTime.now().
                  subtract(Duration(
                    days: 30
                  )),
                  focusDate: taskProvider.selectTime,
                  onDateChange: (selectdate){

                  taskProvider.
                  changeDate(selectdate);
                  Provider.of<TaskProvider>(context,listen: false).getAllTask(userid);
                  },
                  lastDate:  DateTime.now().
                  add(Duration(
                  days: 30
                  )),),
            ),
          ],
        ),
        Expanded(
          child: ListView.separated(itemBuilder:(context,index){
            return TaskItem(
              taskModel:taskProvider.tasks[index] ,
            );
          } ,
              separatorBuilder: (context,index){
                return SizedBox(
                  height: 10.0,
                );
              },
              itemCount: taskProvider.tasks.length),
        )

      ],
    );
  }
}

