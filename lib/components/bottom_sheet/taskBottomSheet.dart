
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:todo_app/app_theme.dart';
// import 'package:todo_app/components/dft_elevated_btn/dft_elevated_btn.dart';
// import 'package:todo_app/components/txt_field/text_field.dart';
// import 'package:todo_app/firebase_functions.dart';
// import 'package:todo_app/models/task_model.dart';
// import 'package:todo_app/models/user_model.dart';
// import 'package:todo_app/provider/user_provider.dart';
//
// import '../../provider/task_provider.dart';
//
// class TaskBottomheet extends StatefulWidget {
//   const TaskBottomheet({super.key});
//
//   @override
//   State<TaskBottomheet> createState() => _TaskBottomheetState();
// }
//
// class _TaskBottomheetState extends State<TaskBottomheet> {
//   var titleController=TextEditingController();
//   var desController=TextEditingController();
//   var fromKey=GlobalKey<FormState>();
//   DateTime selectTime=DateTime.now();
//   DateFormat dateFormat=DateFormat('dd/MM/yy');
//   @override
//   Widget build(BuildContext context) {
//     TaskProvider taskProvider=Provider.of<TaskProvider>(context);
//     return Container(
//       padding: EdgeInsets.all(24),
//       width: MediaQuery.of(context).size.width,
//       height:MediaQuery.of(context).size.height*0.5,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         color: AppTheme.white
//       ),
//       child: Form(
//         key: fromKey,
//         child: Column(
//           children: [
//             dftTxtField(hintTxt: "enter a title",
// controller: titleController,
//         validator: ( value){
//           if(value==null||value.isEmpty){
//             return "title must be not empty";
//           }
//           else{
//             return null;
//           }
//         },
//         ),
//             SizedBox(height:16.0 ,),
//             dftTxtField(
//                 validator: ( value){
//                   if(value==null||value.isEmpty){
//                     return "description must be not empty";
//                   }
//                   else{
//                     return null;
//                   }
//                 },
//                 hintTxt: "enter a description", controller: desController),
//             SizedBox(height:16.0 ,),
//             InkWell(
//               onTap: ()async{
//
//      DateTime? dateTime=await showDatePicker(context: context,
//                     firstDate: DateTime.now().subtract(
//                       Duration(
//                         days: 30
//                       )
//                     ),
//                     lastDate:DateTime.now().add(
//                     Duration(
//                         days: 30
//                     )
//                 ),
//
//
//      initialEntryMode: DatePickerEntryMode.calendarOnly,
//        initialDate: selectTime,
//
//
//      );
//      if(dateTime!=null){
//        selectTime=dateTime;
//        setState(() {
//
//        });
//      }
//               },
//               child: Text(dateFormat.format(selectTime)
//                 ,style: TextStyle(
//                 color: AppTheme.black,
//                 fontSize: 20.0
//               ),),
//             ),
//             dftElevatedBtn(label: "Submit", onPress: (){
//               addTask();
//             })
//           ],
//         ),
//       ),
//     );
//   }
//   addTask(){
//     final userid=Provider.of<UserProvider>(context,listen: false).userModel!.id;
//     if(fromKey.currentState!.validate()){
//       FirebaseFunction.addTaskToFirestore(TaskModel(
//           title: titleController.text, desc: desController.text,
//           dateTime: selectTime),userid).then((_){
//
//         Navigator.of(context).pop();
//         Provider.of<TaskProvider>(context,listen: false).getAllTask(userid);
//             Fluttertoast.showToast(
//                msg: "Task added sucessfully",
//                 backgroundColor: AppTheme.green,
//               fontSize: 20.0,
//               textColor: AppTheme.white,
//               toastLength: Toast.LENGTH_LONG,
//               timeInSecForIosWeb: 5
//             );
//
//       }
//       ).catchError((e){
//         print("the error is $e");
//         Fluttertoast.showToast(
//             msg: "Task Failed to add",
//             backgroundColor: AppTheme.red,
//             fontSize: 20.0,
//             textColor: AppTheme.white,
//             toastLength: Toast.LENGTH_LONG,
//             timeInSecForIosWeb: 5
//         );
//       });
//     }
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app_theme.dart';
import 'package:todo_app/components/dft_elevated_btn/dft_elevated_btn.dart';
import 'package:todo_app/components/txt_field/text_field.dart';
import 'package:todo_app/firebase_functions.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/provider/setting_provider.dart';
import 'package:todo_app/provider/task_provider.dart';
import 'package:todo_app/provider/user_provider.dart';

class TaskBottomSheet extends StatefulWidget {
  const TaskBottomSheet({super.key});

  @override
  State<TaskBottomSheet> createState() => _TaskBottomSheetState();
}

class _TaskBottomSheetState extends State<TaskBottomSheet> {
  var titlecontroll=TextEditingController();
  var desccontroll=TextEditingController();
  DateTime selectTime=DateTime.now();
  DateFormat dateFormat=DateFormat('dd/MM/yy');
  var fromkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider=Provider.of<SettingProvider>(context);
    return Padding(
      padding:EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,

      ),
      child: Container(
        height: MediaQuery.of(context).size.height*0.5,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(24.0),

        decoration: BoxDecoration(
            color: settingProvider.themeMode==ThemeMode.dark?
            AppTheme.containerdark.withOpacity(0.92)
                :AppTheme.white,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Form(
          key: fromkey,
          child : Column(
            children: [
          dftTxtField(
              validator: (value){
                if(value==null||value.trim().isEmpty){
                  return "title must be not empty";
                }else{
                  return null;
                }
              },
              hintTxt: "Enter a Title", controller: titlecontroll),
          SizedBox(height: 20.0,)    ,
           dftTxtField(
               validator: (value){
           if(value==null||value.trim().isEmpty){
             return "Description must be not empty";
           }else{
             return null;
           }
               },
               hintTxt: "Enter a Description", controller: desccontroll),
              SizedBox(height: 20.0,)
              ,
              InkWell(
                onTap: ()async{
            DateTime?dateTime=await      showDatePicker(context: context,
                      firstDate: DateTime.now().subtract(Duration(
                        days: 30
                      )),
                      lastDate: DateTime.now().add(Duration(
                          days: 30
                      )),
                  initialDate: selectTime,
                  initialEntryMode: DatePickerEntryMode.calendarOnly);
            if(dateTime!=null){
              selectTime=dateTime;
              setState(() {

              });
            }
                },
                child: Text(dateFormat.format(selectTime),style:
                Theme.of(context).textTheme.headlineSmall,),
              ),
              SizedBox(height: 20.0,),
              dftElevatedBtn(label: "Submit", onPress: (){
                addTask();
              }),
            ],
          ),
        ),
      ),
    );
  }
  addTask(){
    final userid=Provider.of<UserProvider>(context,listen: false).userModel!.id;
    if(fromkey.currentState!.validate()){
      FirebaseFunction.addTaskToFirestore
        (TaskModel(title: titlecontroll.text,
          desc: desccontroll.text, dateTime: selectTime),userid)
          .then((value) {
           Navigator.of(context).pop();
           Provider.of<TaskProvider>(context,listen: false).
           getAllTask(userid);
Fluttertoast.showToast(msg: "Task added Sucessfully",
backgroundColor: AppTheme.green,
  fontSize: 18.0,
  gravity: ToastGravity.BOTTOM,
  timeInSecForIosWeb: 10,
  toastLength: Toast.LENGTH_LONG,
  textColor: AppTheme.white
);
      }).catchError((e){
        print("the error is $e");
        Fluttertoast.showToast(msg: "Task Failed",
            backgroundColor: AppTheme.red,
            fontSize: 18.0,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 10,
            toastLength: Toast.LENGTH_LONG,
            textColor: AppTheme.white
        );
      });

    }
  }
}

