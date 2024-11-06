//
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class TaskModel{
//   String id;
//   String title;
//   String des;
//   DateTime dateTime;
//   bool isDone;
//   TaskModel({
//      this.id="",
//     required this.title,
//     required this.des,
//     required this.dateTime,
//      this.isDone=false,
//   });
//   TaskModel.fromJson(Map<String,dynamic>json):this(
//     title: json['title'],
//     id: json['id'],
//     des: json['des'],
//     dateTime: (json['dateTime']as Timestamp).toDate(),
//     isDone: json['isDone'],
//   );
//   Map<String,dynamic> toJson()=>{
//     "id":id,
//     "title":title,
//     "des":des,
//     "dateTime":Timestamp.fromDate(dateTime),
//     "isDone":isDone
//   };
// }
import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel{
  String id;
  String title;
  String desc;
  DateTime dateTime;
  bool isDone;
  TaskModel({
     this.id="",
    required this.title,
    required this.desc,
    required this.dateTime,
     this.isDone=false,
});
  TaskModel.fromJson(Map<String,dynamic>json):this(
    id: json['id'],
    title: json['title'],
    dateTime: (json['dateTime'] as Timestamp).toDate(),
    desc: json['desc'],
    isDone: json['isDone']
  );
  Map<String,dynamic>toJson()=>{
    'id':id,
    'title':title,
    'desc':desc,
    'dateTime':Timestamp.fromDate(dateTime),
    'isDone':isDone,
  };
}