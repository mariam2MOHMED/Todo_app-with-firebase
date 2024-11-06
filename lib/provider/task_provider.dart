
// import 'package:flutter/cupertino.dart';
// import 'package:todo_app/firebase_functions.dart';
//
// import '../models/task_model.dart';
//
// class TaskProvider with ChangeNotifier{
//   List<TaskModel>tasks=[];
//   DateTime selectTime=DateTime.now();
//   void changeDate(DateTime dateTime){
//    selectTime=dateTime;
//    notifyListeners();
//   }
//   Future<void>getAllTask(String userid)async{
//   List<TaskModel>alltask=await FirebaseFunction.
//   getTasksFromFireStore(userid);
//   tasks=alltask.where((task)=>
//   task.dateTime.day==selectTime.day &&
//       task.dateTime.year==selectTime.year &&
//       task.dateTime.month==selectTime.month
//   ).toList();
// notifyListeners();
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/firebase_functions.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/provider/user_provider.dart';

class TaskProvider with ChangeNotifier{
  DateTime selectTime=DateTime.now();
  List<TaskModel>tasks=[];
  changeDate( DateTime dateTime){
    selectTime=dateTime;
    notifyListeners();
  }
void getAllTask(String userid)async{

  List<TaskModel>alltasks=await FirebaseFunction.
  getTaskFromFirestore(userid);
  tasks=alltasks.where((task) =>
    task.dateTime.day==selectTime.day&&
        task.dateTime.month==selectTime.month&&
        task.dateTime.year==selectTime.year ).toList();
  notifyListeners();
}
}