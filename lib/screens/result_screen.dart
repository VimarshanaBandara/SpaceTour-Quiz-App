import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quize_app_space_hack/components/action_button.dart';
import 'package:quize_app_space_hack/components/gradient_box.dart';
import 'package:quize_app_space_hack/models/question.dart';
import 'package:quize_app_space_hack/screens/quize_screen.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({
    Key? key,
    required this.score,
    required this.questions,
    required this.totalTime,

  }) : super(key: key);

  final int score;
  final List<Question> questions;
  final int totalTime;

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox.expand(
          child: GradientBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Result: ${widget.score}/${widget.questions.length}',style: TextStyle(color: Colors.white,fontSize: 25.0,fontWeight: FontWeight.bold),),
                SizedBox(height: 40.0,),
                ActionButton(title: 'PlayAgain',
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>QuizScreen(totalTime: widget.totalTime, questions: widget.questions)));

                    }

                ),

              ],
            ),
          ),
        )
    );
  }

  @override
  void initState() {

    super.initState();
    _updateHighScore();
  }

  Future<void> _updateHighScore() async {
    final authUser = FirebaseAuth.instance.currentUser;
    if(authUser == null) return;

    final userRef = FirebaseFirestore.instance.collection('users').doc(authUser.uid);

    final userDoc = await userRef.get();

    if(userDoc.exists){
      final user = userDoc.data();
      if(user == null) return;

      final lastHighScore = user['score'];

      if(lastHighScore >= widget.score){
        return;
      }
       userRef.update({'score' : widget.score});
      return;
    }

    userRef.set({
      'email': authUser.email,
      'photoUrl':authUser.photoURL,
      'score':widget.score,
      'name':authUser.displayName,

    });

  }

}
