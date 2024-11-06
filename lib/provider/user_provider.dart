// import 'package:flutter/foundation.dart';
// import 'package:todo_app/models/user_model.dart';
//
// class UserProvider with ChangeNotifier
// {
//   UserModel?userModel;
//   void updateUser(UserModel user){
//     userModel=user;
//     notifyListeners();
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:todo_app/models/user_model.dart';

class UserProvider with ChangeNotifier{
  UserModel? userModel;
void getUser(UserModel curruser){
  userModel=curruser;
  notifyListeners();
}
}