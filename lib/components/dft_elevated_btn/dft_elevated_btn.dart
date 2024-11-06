//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:todo_app/app_theme.dart';
//
// import '../../provider/task_provider.dart';
//
// class dftElevatedBtn extends StatelessWidget {
//   String txt;
//   Function()onpress;
//    dftElevatedBtn({
//     required this.txt,
//      required this.onpress,
// });
//
//   @override
//   Widget build(BuildContext context) {
//     TaskProvider taskProvider=Provider.of<TaskProvider>(context);
//     return ElevatedButton(
//         style:ElevatedButton.styleFrom(
//           backgroundColor: AppTheme.blue,
//           foregroundColor: AppTheme.white,
//           fixedSize: Size(MediaQuery.of(context).size.width, 52),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(22)
//           )
//         ) ,
//         onPressed:(){
//       onpress();
//     } , child: Text(txt,textAlign: TextAlign.center,
//       style:TextStyle(
//         color: AppTheme.white,
//         fontSize: 20,
//         fontWeight: FontWeight.bold
//       ) ,));
//   }
// }
//
import 'package:flutter/material.dart';
import 'package:todo_app/app_theme.dart';

class dftElevatedBtn extends StatelessWidget {
  String label;
  Function()onPress;
   dftElevatedBtn({
    required this.label,
     required this.onPress,
});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

        style: ElevatedButton.styleFrom(
          fixedSize: Size(MediaQuery.of(context).size.width, 52),
          backgroundColor: AppTheme.blue,
          foregroundColor: AppTheme.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0)
          ),

        ),
        onPressed:(){
      onPress();
    },
        child: Text(label,style:
        TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: AppTheme.white
        ),));
  }
}
