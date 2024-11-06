// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:todo_app/app_theme.dart';
// import 'package:todo_app/components/dft_elevated_btn/dft_elevated_btn.dart';
// import 'package:todo_app/components/txt_field/text_field.dart';
// import 'package:todo_app/firebase_functions.dart';
// import 'package:todo_app/home_tab.dart';
// import 'package:todo_app/models/task_model.dart';
// import 'package:todo_app/provider/task_provider.dart';
// import 'package:todo_app/provider/user_provider.dart';
//
// class EditTask extends StatefulWidget {
//   static String routeName="/EditTask";
//   const EditTask({super.key});
//
//   @override
//   State<EditTask> createState() => _EditTaskState();
// }
//
// class _EditTaskState extends State<EditTask> {
//   var titlecon=TextEditingController();
//   var desccon=TextEditingController();
//   DateTime selecTime=DateTime.now();
//   DateFormat dateFormat=DateFormat('dd/MM/yy');
//   @override
//   Widget build(BuildContext context) {
//     var arg=ModalRoute.of(context)!.settings!.arguments as TaskModel;
//     final userid=Provider.of<UserProvider>(context,listen: false).userModel!.id;
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         backgroundColor: AppTheme.blue,
//         centerTitle: true,
//         title: Text("Edit Task",
//         style: TextStyle(
//           color: AppTheme.white,
//           fontSize: 20.0
//         ),
//         ),
//       ),
//       body: Container(
//         padding: EdgeInsets.all(24),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15),
//           color: AppTheme.white
//         ),
//         margin: EdgeInsets.symmetric(
//           horizontal: MediaQuery.of(context).size.width*0.1,
//           vertical: MediaQuery.of(context).size.height*0.06,
//         ),
//       child: Column(
//         children: [
//           Text("Edit Task",style: TextStyle(
//             color: AppTheme.black,
//             fontWeight: FontWeight.bold,
//             fontSize: 24.0
//           ),),
//           SizedBox(height: 24.0,),
//
//           TextFormField(
//     validator: (value){
//     if(value==null||value.isEmpty){
//     return "title must be not empty";
//     }else{
//     return null;
//     }},
//             initialValue: arg.title,
//             onChanged: (value){
//       arg.title=value;
//       setState(() {
//
//       });
//             },
//             decoration: InputDecoration(
//               hintText: 'Enter a title',
//               border: UnderlineInputBorder(),
//
//             ),
//
//           ),
//           SizedBox(height: 24.0,),
//           TextFormField(
//             validator: (value){
//               if(value==null||value.isEmpty){
//                 return "Description must be not empty";
//               }else{
//                 return null;
//               }},
//             initialValue: arg.des,
//             onChanged: (value){
//               arg.des=value;
//               setState(() {
//
//               });
//             },
//             decoration: InputDecoration(
//               hintText: 'Enter a Description',
//               border: UnderlineInputBorder(),
//
//             ),
//
//           ),
//
//           SizedBox(height: 24.0,),
//           InkWell(
//             onTap: ()async{
//               DateTime? newDate=await chooseDate();
//               if(newDate!=null){
//                 arg.dateTime=newDate;
//                 setState(() {
//
//                 });
//               }
//
//             },
//             child: Align(
//               alignment: AlignmentDirectional.center,
//               child: Text(dateFormat.format
//                 (arg.dateTime).toString(),
//                 style: TextStyle(
//                 color: AppTheme.black,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 24.0
//               ),),
//             ),
//           ),
//           SizedBox(height: 24.0,),
//           dftElevatedBtn(txt: "Save changes",
//               onpress: ()async{
//
// await FirebaseFunction.updateTaskFromFireStore(arg,userid).
//     then((_){
//
//   Provider.of<TaskProvider>(context,listen: false).getAllTask(userid);
//   Fluttertoast.showToast(
//       msg: "Task edited sucessfully",
//       backgroundColor: AppTheme.green,
//       fontSize: 20.0,
//       textColor: AppTheme.white,
//       toastLength: Toast.LENGTH_LONG,
//       timeInSecForIosWeb: 5
//   );
//
//   Navigator.pop(context);
// }
// ).catchError((error){
//   print("the erroris $error");
// });
//
//
//               })
//         ],
//       ),
//       ),
//
//     );
//   }
//   chooseDate()async{
//     DateTime?dateTime=await showDatePicker(context: context,
//         firstDate: DateTime.now().subtract(Duration(
//           days: 30
//         )),
//         lastDate:DateTime.now().add(Duration(
//             days: 30
//         )),
//     initialDate: selecTime,
//
//     ) ;
//     if(dateTime!=null){
// selecTime=dateTime;
// setState(() {
//
// });
//     }
//   return dateTime;
//   }
// }
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app_theme.dart';
import 'package:todo_app/components/dft_elevated_btn/dft_elevated_btn.dart';
import 'package:todo_app/firebase_functions.dart';
import 'package:todo_app/models/task_model.dart';

import '../../provider/task_provider.dart';
import '../../provider/user_provider.dart';

class EditTask extends StatefulWidget {
  static String routeName='/EditTask';
   EditTask({super.key});

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  DateTime selectTime=DateTime.now();
  DateFormat dateFormat=DateFormat('dd/MM/yy');
  var fromkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var arg=ModalRoute.of(context)!.settings.arguments as TaskModel;
    return Scaffold(
      body: Container(

        margin: EdgeInsets.symmetric(
          horizontal: 50,
          vertical: 80,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: AppTheme.white
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric
            (horizontal: 24.0),
          child: Form(
            key: fromkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              TextFormField(
              validator: (value){
                if(value==null||value.trim().isEmpty){
                  return  "title must be not empty";
                  }else{
                  return null;
                  }
                  },
                 initialValue: arg.title,
            onChanged: (value){
              arg.title=value;
                  setState(() {

                  });
            },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(

                border: UnderlineInputBorder( ),
                hintText: "enter a title",

              ),
            ),
                SizedBox(height: 20.0,),
                TextFormField(
                  validator: (value){
                    if(value==null||value.trim().isEmpty){
                      return  "Description must be not empty";
                    }else{
                      return null;
                    }
                  },
                  initialValue: arg.desc,
                  onChanged: (value){
                    arg.desc=value;
                    setState(() {

                    });
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(

                    border: UnderlineInputBorder( ),
                    hintText: "enter a title",

                  ),
                ),
                SizedBox(height: 20.0,),
                InkWell(
                  onTap: ()async{
                    DateTime? newDate=await chooseYourDate();
                  if(newDate!=null){
                    arg.dateTime=newDate;
                    setState(() {

                    });
                  }
                  },
                  child: Align(
                    alignment: AlignmentDirectional.center,
                    child: Text("${dateFormat.format(arg.dateTime)}",
                    style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
                dftElevatedBtn(label: "Save changes",
                    onPress: ()async{
                  final userid=Provider.of<UserProvider>(context,listen: false).userModel!.id;
             if(fromkey.currentState!.validate())     {
               await FirebaseFunction.updateTask(arg,userid).
    then((_){

  Provider.of<TaskProvider>(context,listen: false).getAllTask(userid);
  Fluttertoast.showToast(
      msg: "Task edited sucessfully",
      backgroundColor: AppTheme.green,
      fontSize: 20.0,
      textColor: AppTheme.white,
      toastLength: Toast.LENGTH_LONG,
      timeInSecForIosWeb: 5
  );

  Navigator.pop(context);
}
).catchError((error){
  print("the erroris $error");
});
             }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
  chooseYourDate()async{
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
    return dateTime;
  }
}

