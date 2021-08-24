import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quize_app_space_hack/components/gradient_box.dart';
import 'package:quize_app_space_hack/models/question.dart';
class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key , required this.totalTime , required this.questions}) : super(key: key);

  final int totalTime;
  final List<Question> questions;

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {

  late int _currentTime;
  late Timer _timer;
  int  _currentIndex = 0;

  void initState(){
    super.initState();
    _currentTime = widget.totalTime;
   _timer = Timer.periodic(Duration(seconds: 1) , (timer){
     print(_currentTime);
      setState(() {
        _currentTime-= 1;
      });

      if(_currentTime==0){
        _timer.cancel();
      }




    } );
  }

  @override
  void dispose(){
    _timer.cancel();
     super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:GradientBox(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40.0,),
                  SizedBox(
                      height: 40.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child:Stack(
                          fit: StackFit.expand,
                          children: [
                            LinearProgressIndicator(
                              value: _currentTime/widget.totalTime,
                            ),
                            Center(
                              child: Text(_currentTime.toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20.0),),
                            )
                          ],
                        )
                      )
                  ),
                  Text('Questions',style: TextStyle(fontSize: 20.0,color: Colors.white),),
                  Text(widget.questions[_currentIndex].question)

                ],
              ),
            )
        )
    );
  }
}
