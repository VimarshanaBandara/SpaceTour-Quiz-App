import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quize_app_space_hack/components/action_button.dart';
import 'package:quize_app_space_hack/components/gradient_box.dart';
import 'package:quize_app_space_hack/components/rank_auth_button.dart';
import 'package:quize_app_space_hack/models/question.dart';
import 'package:quize_app_space_hack/providers/quiz_provider.dart';
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
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(

            image: DecorationImage(
              image: AssetImage('images/bg2.jpg'),
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop),
            ),
          ),
          child: SingleChildScrollView(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 60.0,),
                Text(
                  'Result: ${widget.score} / ${widget.questions.length}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
                SizedBox(height: 40),
                ActionButton(
                  title: 'Play Again',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => QuizScreen(
                          totalTime: widget.totalTime,
                          questions: widget.questions,
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 40),
                RankAuthButton()
              ],
            ),
          ),
        )
      );

  }

  @override
  void initState() {
    super.initState();
    final provider = context.read<QuizProvider>();
    provider.updateHighscore(widget.score);
  }
}