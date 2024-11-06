// class UserModel{
//   String id;
//   String email;
//   String password;
//   UserModel({
//     required this.id,
//     required this.email,
//     required this.password,
// });
//   Map<String,dynamic>toJson()=>{
//     'id':id,
//     'email':email,
//     'password':password
//   };
//   UserModel.fromJson(Map<String,dynamic>json):this(
//     id: json['id'],
//     email: json['email'],
//     password: json['password']
//   );
// }
class UserModel{
  String id;
  String email;
  String password;
  UserModel({
    required this.id,
    required this.email,
    required this.password,
  });
  UserModel.fromJson(Map<String,dynamic>json):this(
    id: json['id'],
    email: json['email'],
    password: json['password']
  );
  Map<String,dynamic>toJson()=>{
    'id':id,
    'email':email,
    'password':password
  };

}