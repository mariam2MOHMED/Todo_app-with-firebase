// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:todo_app/models/task_model.dart';
// import 'package:todo_app/models/user_model.dart';
//
// class FirebaseFunction{
// static CollectionReference<TaskModel> getTaskCollection( String userid)=>
//    getUserCollection().doc(userid).collection("tasks").
// withConverter<TaskModel>
//   (fromFirestore: (docSnapShot,_)=>TaskModel.fromJson(docSnapShot.data()!),
//     toFirestore: (taskmodel,_)=>taskmodel.toJson());
// static Future<void>addTaskToFirestore(TaskModel taskModel,String userid)async{
//   CollectionReference<TaskModel> taskColl=getTaskCollection(userid);
//   DocumentReference<TaskModel> docRef=taskColl.doc();
//  taskModel.id= docRef.id;
//  return docRef.set(taskModel);
// }
// static  Future<void>deleteTaskFromFirestore(TaskModel taskModel,String userid)async{
//   CollectionReference<TaskModel> taskColl=getTaskCollection(userid);
//   return taskColl.doc(taskModel.id).delete();
// }
//
// static  Future<void>updateTask(TaskModel taskModel,String userid)async{
//   CollectionReference<TaskModel> taskColl=getTaskCollection(userid);
//
//   return taskColl.doc(taskModel.id).update(taskModel.toJson());
// }
// static Future<List<TaskModel>> getTaskFromFirestore(
// String userid
//     )async{
//   CollectionReference<TaskModel> taskColl=getTaskCollection(userid);
//   QuerySnapshot<TaskModel> querySnapshot=await taskColl.get();
//   return querySnapshot.docs.map((e) =>
//   e.data()
//   ).toList();
//
// }
// static CollectionReference<UserModel> getUserCollection()=>
//     FirebaseFirestore.instance.collection("users").
// withConverter<UserModel>(fromFirestore: (docSnapshot,_)=>
//     UserModel.fromJson(docSnapshot.data()!),
//     toFirestore:(userModel,_)=>userModel.toJson() );
// static Future<UserModel> register({
//   required String name,
//   required String email,
//   required String password,
// })async{
//   final credential=await FirebaseAuth.instance.
//   createUserWithEmailAndPassword
//     (email: email, password: password);
//  // print(credential.user!.uid);
//   final user=UserModel(id: credential.user!.uid,
//       email: email, password: password);
//   final usercoll=getUserCollection();
//   await usercoll.doc(user.id).set(user);
//   return user;
// }
// static Future<UserModel> login(
//     {
//       required String email,
//       required String password,
//     }
//     )async{
//   final credential=await FirebaseAuth.
//   instance.signInWithEmailAndPassword
//     (email: email, password: password);
//   final usercoll=getUserCollection();
//
//   final docSnapshot=
//   await usercoll.doc( credential.user!.uid).get();
// return docSnapshot.data()!;
// }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/models/user_model.dart';

class FirebaseFunction{
  static CollectionReference<TaskModel> getTaskCollection(String userid)=>
      getUserCollection().doc(userid).
  collection('tasks').withConverter<TaskModel>
    (fromFirestore: (documentSnapshot,_)=>TaskModel.fromJson
    (documentSnapshot.data()!),
      toFirestore: (task,_)=>task.toJson());
  static Future<void>addTaskToFirestore(TaskModel taskModel
      ,String userid)
  async{
    CollectionReference<TaskModel> taskcoll=getTaskCollection(userid);
    DocumentReference<TaskModel>docRef= taskcoll.doc();
    taskModel.id=docRef.id;
    return docRef.set(taskModel);
  }
  static Future<void>updateTask(TaskModel taskModel,String userid)async{
    CollectionReference<TaskModel> taskcoll=getTaskCollection(userid);
    return taskcoll.doc(taskModel.id).update(taskModel.toJson());
  }
  static Future<void>deleteTaskFromFirestore(TaskModel taskModel,String userid)async{
    CollectionReference<TaskModel> taskcoll=getTaskCollection(userid);
    return taskcoll.doc(taskModel.id).delete();
  }
  static Future<List<TaskModel>>getTaskFromFirestore(String userid)async{
    CollectionReference<TaskModel> taskcoll=getTaskCollection(userid);
    QuerySnapshot<TaskModel>querySnapshot=await taskcoll.get();
    return querySnapshot.docs.map((e) => e.data()!).toList();
  }
  static CollectionReference<UserModel> getUserCollection()=>FirebaseFirestore.instance.collection('users').
  withConverter<UserModel>(fromFirestore:
      (docSnapShot,_)=>UserModel.fromJson(docSnapShot.data()!),
      toFirestore: (user,_)=>user.toJson());
  static Future<UserModel>register({
    required String name,
    required String email,
    required String password,
  })async{
    final crediental=await FirebaseAuth.instance.
    createUserWithEmailAndPassword(email: email, password: password);
    final user=UserModel(id: crediental.user!.uid, email: email, password: password);
 final usercoll=getUserCollection();
 await usercoll.doc(user.id).set(user);
 return user;
  }
  static Future<UserModel>login({

    required String email,
    required String password,
  })async{
    final crediental=await FirebaseAuth.instance.
    signInWithEmailAndPassword(email: email, password: password);
    final usercoll=getUserCollection();
  final doc=  await usercoll.doc(crediental.user!.uid)
      .get();
  return doc.data()!;
  }
  static Future<void>signOut()=>FirebaseAuth.instance.signOut();
}
