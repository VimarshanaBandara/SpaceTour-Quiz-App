import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quize_app_space_hack/components/gradient_box.dart';
import 'package:quize_app_space_hack/models/question.dart';
import 'package:quize_app_space_hack/screens/result_screen.dart';
class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key , required this.totalTime , required this.questions }) : super(key: key);

  final int totalTime;
  final List<Question> questions;



  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {

  late int _currentTime;
  late Timer _timer;
  int  _currentIndex = 0;
  String _selectedAnswer = '';
  int _score =0;

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
        pushResultScreen(context);
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
    final currentQuestion = widget.questions[_currentIndex];
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
                  SizedBox(height: 10.0,),
                  Text(currentQuestion.question,style: TextStyle(fontSize: 18.0 , color: Colors.white,fontWeight: FontWeight.bold),),

                  //Spacer(),


                  Expanded(
                    child:ListView.builder(
                      itemBuilder: (context , index){
                        final answer = currentQuestion.answers[index];
                        return AnswerTile(
                          isSelected: answer == _selectedAnswer,
                          answer: answer,
                          correctAnswer: currentQuestion.correctAnswer,
                          onTap: (){
                              setState(() {

                                _selectedAnswer = answer;

                              });

                              if (answer == currentQuestion.correctAnswer) {
                                _score++;
                              }



                              Future.delayed(Duration(microseconds: 100),(){

                                if (_currentIndex == widget.questions.length - 1) {
                                  pushResultScreen(context);
                                  return;
                                }

                                setState(() {
                                  _currentIndex++;
                                  _selectedAnswer = '';
                                });


                              });


                          },
                        );
                      },
                      itemCount:currentQuestion.answers.length,
                    ),
                  )


                ],
              ),
            )
        )
    );
  }

  void pushResultScreen(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
          builder: (context) =>
              ResultScreen(
                questions: widget.questions,
                totalTime: widget.totalTime,
                score: _score,
              )
      ),
    );
  }
}



class AnswerTile extends StatelessWidget {
  const AnswerTile({
    Key? key,
    required this.isSelected,
    required this.answer,
    required this.correctAnswer,
    required this.onTap,
  }) : super(key: key);

  final bool isSelected;
  final String answer;
  final String correctAnswer;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor.withOpacity(0.6),
      child: ListTile(
        onTap: () => onTap(),
        title: Text(
          answer,
          style: TextStyle(
            fontSize: 18,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  Color get cardColor {
    if (!isSelected) return Colors.white;

    if (answer == correctAnswer) {
      return Colors.teal;
    }

    return Colors.redAccent;
  }
}
