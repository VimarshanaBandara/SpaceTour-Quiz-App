import 'package:flutter/material.dart';
import 'package:quize_app_space_hack/components/gradient_box.dart';
import 'package:quize_app_space_hack/models/question.dart';
import 'package:quize_app_space_hack/quize_screen.dart';
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
              Text('Space Tour',style: TextStyle(color: Colors.white),),
              SizedBox(height: 40.0,),
              SizedBox(
                height:50.0 ,
                width: 200.0,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>QuizScreen(totalTime: 10, questions:question)));
                  },
                  child: Text('Start'),

                ),
              )
            ],
          ),
        )
      )
    );
  }
}
