import 'package:flutter/material.dart';
class GradientBox extends StatelessWidget {
  const GradientBox({Key? key , required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(

        image: DecorationImage(
          image: AssetImage('images/bg2.jpg'),
          fit: BoxFit.cover,
          colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
        ),
      ),
      child: child,
    );
  }
}
