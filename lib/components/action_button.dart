import 'package:flutter/material.dart';
class ActionButton extends StatelessWidget {
  const ActionButton({Key? key,required this.title,required this.onTap}) : super(key: key);

  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      width: 200.0,
      child: ElevatedButton(
        onPressed: () => onTap(),
        child: Text(title),
      ),
    );
  }
}
