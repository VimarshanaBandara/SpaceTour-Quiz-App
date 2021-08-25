import 'package:flutter/material.dart';
import 'package:quize_app_space_hack/components/action_button.dart';
import 'package:quize_app_space_hack/components/gradient_box.dart';
import 'package:quize_app_space_hack/models/question.dart';
import 'package:quize_app_space_hack/screens/quize_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: GradientBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Space Tour',style: TextStyle(color: Colors.white,fontSize: 10.0),),
              SizedBox(height: 40.0,),
              ActionButton(
                onTap:(){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>QuizScreen(
                    totalTime:10 ,
                    questions:question,
                  )));
                } ,
                title: 'Start',
              ),
            ],
          ),
        )
      )
    );
  }
}


