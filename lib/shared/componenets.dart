
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sam_express/const/const.dart';
import 'package:sam_express/style/mycolors.dart';

Widget my_textField({
  required var controller,
  String label = '',
  String hint = '',
  IconData? sufix_icon,
  Function()? sufix_fuction,
  Function()? onTap,
  Color border_color = Colors.grey,
  Color icon_color = Colors.grey,
  bool invisible = false,
  String validator_text = '',
  TextInputType keyboardType = TextInputType.multiline,
}) => SizedBox(
  height: 50,
  child: TextFormField(
      keyboardType: keyboardType,
      onTap: onTap ?? () {},
      obscureText: invisible,
      cursorColor: border_color,
      validator: (value) {
        if (value!.isEmpty) {
          return validator_text;
        }
      },
      controller: controller,
      decoration: InputDecoration(
        label: Text(label),
        hintText: hint,
        suffixIcon: IconButton(
          onPressed: sufix_fuction ?? () {},
          icon: Icon(sufix_icon, color: icon_color,),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(
            color: MyColors.grey,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(
            color: border_color,
          ),
        ),
      ),
    ),
);
    

Widget myButton({
  required Function() function,
  required String text,
}) => Container(
  decoration: BoxDecoration(
    color: MyColors.mainColor,
    borderRadius: BorderRadius.circular(30),
  ),
  child: TextButton(
      onPressed: function,
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(15)),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),
      ),
    ),
);
    
FloatingActionButton IconTextButton({
  required Function() function,
  required String text,
  required IconData icon,
  Color? iconColor ,
  Color? bgColor ,
})=>FloatingActionButton.extended(
  heroTag: null,
  label: Text(
    text, 
    style: TextStyle(
      fontWeight: FontWeight.bold,
      color: iconColor?? MyColors.bgColor,
      fontSize: 16,
    ),
  ), 
  backgroundColor: bgColor?? MyColors.mainColor,
  icon: Icon( icon, size: 24.0, color: iconColor?? MyColors.bgColor,),
  onPressed: function,
);

TextButton myTextButton({
  required Function() function,
  required String text,
  Color? color,
}) =>
    TextButton(
      onPressed: function,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: color?? MyColors.bgColor,
          fontSize: 15
        ),
      ),
    );

void toast(
    {required String msg,
    Color textColor = Colors.red,
    Color? bgColor,
    double fontSize = 16,
    var gravity = ToastGravity.BOTTOM}) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    gravity: gravity,
    timeInSecForIosWeb: 5,
    backgroundColor: bgColor ?? const Color.fromARGB(97, 158, 158, 158),
    textColor: textColor,
    fontSize: fontSize,
  );
}


Future<Widget> myNotification({
  required context,
  required Widget content,
  String title = '',
}) async {
  return await showDialog(
    context: context,
    /********** create my popup page ********* */
    builder: (context) => AlertDialog(
      /******* popup title ****** */
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline1,
      ),
      /******** popup content *******  */
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            content,
            horizon_spacing,
            myTextButton(
              text: 'EXIT',
              function: (){ Navigator.of(context).pop(); }
            ),
          ],
        ),
      ),
    ),
  );
}