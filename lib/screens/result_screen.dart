import 'package:flutter/material.dart';
import 'package:quize_app_space_hack/components/action_button.dart';
import 'package:quize_app_space_hack/components/gradient_box.dart';
import 'package:quize_app_space_hack/models/question.dart';
import 'package:quize_app_space_hack/screens/quize_screen.dart';
class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key,required this.score,required this.questions,required this.totalTime,}) : super(key: key);

  final int score;
  final List<Question> questions;
  final int totalTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox.expand(
          child: GradientBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Results: $score/${questions.length}',style: TextStyle(color: Colors.white,fontSize: 25.0,fontWeight: FontWeight.bold),),
                SizedBox(height: 40.0,),
                ActionButton(title: 'PlayAgain',
                    onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>QuizScreen(totalTime: totalTime, questions: questions)));

                    }

                ),
                
              ],
            ),
          ),
        )
    );
  }
}
