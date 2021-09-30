import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class ActionButton extends StatelessWidget {
  const ActionButton({Key? key,required this.title,required this.onTap ,  this.isPrimary=true}) : super(key: key);

  final String title;
  final Function onTap;
  final bool isPrimary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      width: 200.0,
      child: isPrimary ? ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.yellowAccent),
        onPressed: () => onTap(),
        child: Text(title,style:GoogleFonts.lobster(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold)),
      ) : TextButton(
          onPressed: ()=> onTap(),
          child: Text(title,style: TextStyle(fontSize: 20.0,color: Colors.white,decoration: TextDecoration.underline,fontWeight: FontWeight.bold),)
      )
    );
  }
}
