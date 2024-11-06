//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:provider/provider.dart';
// import 'package:todo_app/app_theme.dart';
// import 'package:todo_app/firebase_functions.dart';
// import 'package:todo_app/provider/user_provider.dart';
//
// import '../../models/task_model.dart';
// import '../../provider/task_provider.dart';
// import '../../tabs/task/edit_task.dart';
//
// class TaskItem extends StatefulWidget {
//   TaskModel taskModel;
//    TaskItem({
//     required this.taskModel
// });
//
//   @override
//   State<TaskItem> createState() => _TaskItemState();
// }
//
// class _TaskItemState extends State<TaskItem> {
//   @override
//   Widget build(BuildContext context) {
//     TaskProvider taskProvider=Provider.of<TaskProvider>(context);
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 20.0),
//       child: Slidable(
//         startActionPane: ActionPane(motion: DrawerMotion(),
//             children: [
//               SlidableAction(onPressed: (context){
//                 final userid=Provider.of<UserProvider>(context,
//                     listen: false).userModel!.id;
//                 FirebaseFunction.deleteTaskFromFireStore
//                   (widget.taskModel,userid).
//                 then((_){
//                   Provider.of<TaskProvider>(context,listen: false).
//                   getAllTask(userid);
//
//                 }).catchError((e){
//                   print("e");
//                 });
//               },
//               borderRadius: BorderRadius.circular(12),
//                 backgroundColor: AppTheme.red,
//                 foregroundColor: AppTheme.white,
//                 label: "Delete",
//                 icon: Icons.delete,
//                 spacing: 4,
//
//               ),
//               SlidableAction( onPressed: (context){
//                 Navigator.of(context).pushNamed(EditTask.routeName,
//                 arguments: widget.taskModel
//                 );
//               },
//                 borderRadius: BorderRadius.circular(12),
//                 backgroundColor: AppTheme.green,
//                 foregroundColor: AppTheme.white,
//                 label: "Edit",
//                 icon: Icons.edit,
//                 spacing: 4,
//
//               ),
//             ]),
//         child: Container(
//           padding: EdgeInsets.symmetric(horizontal: 20,
//           vertical: 20.0
//           ),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15.0),
//             color: AppTheme.white,
//
//           ),
//           child: Row(
//             children: [
//               Container(
//                 height:62 ,
//                 width: 4,
//                 color: widget.taskModel.isDone==true?AppTheme.green:AppTheme.blue,
//                 margin: EdgeInsets.only(right: 10.0),
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Text("${widget.taskModel.title}",style:
//                   Theme.of(context).textTheme.headlineMedium!.copyWith(
//                   color:   widget.taskModel.isDone==true?AppTheme.green:AppTheme.blue,
//                   ),),
//                   SizedBox(height: 10.0,),
//                   Text("${widget.taskModel.des}"
//                     ,style:
//                     Theme.of(context).textTheme.headlineSmall,),
//
//                 ],
//               ),
//               Spacer(),
//   widget.taskModel.isDone==true?Text("isDone!",style: TextStyle(
//    color:AppTheme.green,
//     fontSize: 20,
//     fontWeight:FontWeight.bold
//
//   ),):            GestureDetector(
//     onTap: (){
//       widget.taskModel.isDone=true;
//
//       setState(() {
//
//       });
//     },
//     child: Container(
//                   width: 69,
//                   height: 34,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12),
//                       color: AppTheme.blue
//                   ),
//                   child: Icon(
//                     Icons.check,
//                     color: AppTheme.white,
//                   ),
//                 ),
//   )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app_theme.dart';
import 'package:todo_app/firebase_functions.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/provider/task_provider.dart';
import 'package:todo_app/tabs/task/edit_task.dart';

import '../../provider/setting_provider.dart';
import '../../provider/user_provider.dart';

class TaskItem extends StatefulWidget {
  TaskModel taskModel;
   TaskItem({
    required this.taskModel
});

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {

  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider=Provider.of<SettingProvider>(context);
    return
      Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: Slidable(
        direction: Axis.horizontal,
        startActionPane: ActionPane(
            motion: DrawerMotion(),
            children: [
              SlidableAction(onPressed: (context)async{
                final userid=Provider.of<UserProvider>(context,listen: false).userModel!.id;
await FirebaseFunction.deleteTaskFromFirestore(widget.taskModel,userid).
then((value) {
  print("deleted task");
}).catchError((e){
  print("the error is $e");
});
Provider.of<TaskProvider>(context,listen: false).getAllTask(userid);
              },
              backgroundColor: AppTheme.red,
                foregroundColor: AppTheme.white,
                borderRadius: BorderRadius.circular(15),
                label: 'Delete',
                icon: Icons.delete,
              ),
              SlidableAction(onPressed: (context){
Navigator.of(context).pushNamed(EditTask.routeName,arguments: widget.taskModel);
              },
                backgroundColor: AppTheme.green,
                foregroundColor: AppTheme.white,
                borderRadius: BorderRadius.circular(15),
                label: 'Edit',
                icon: Icons.edit,
              )
            ]),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: settingProvider.themeMode==ThemeMode.dark?
            AppTheme.containerdark:AppTheme.white
          ),
          child: Row(

            children: [
              Container(
                width: 4,
                height: 62,
                margin: EdgeInsets.only(
                  right: 10.0
                ),
                color: widget.taskModel.isDone==true?AppTheme.green:AppTheme.blue,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(widget.taskModel.title,style:
                  Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: widget.taskModel.isDone==true?AppTheme.green:AppTheme.blue,
                  ),),
                  SizedBox(height: 12.0,),
                  Text(widget.taskModel.desc,style:
                  Theme.of(context).textTheme.headlineSmall,),
                ],
              ),
              Spacer(),
              GestureDetector(
               onTap: (){
                 widget.taskModel.isDone=true;
                 setState(() {

                 });
               },
                child:
                widget.taskModel.isDone==true?Text("is Done💚",
                style: TextStyle(
                  color: AppTheme.green,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold
                ),
                ):        Container(
                  width: 69,
                  height: 34,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppTheme.blue
                  ),
                  child: Icon(
                    Icons.check,
                    color: AppTheme.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

