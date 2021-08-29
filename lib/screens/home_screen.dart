import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quize_app_space_hack/components/action_button.dart';
import 'package:quize_app_space_hack/components/gradient_box.dart';
import 'package:quize_app_space_hack/components/rank_auth_button.dart';
import 'package:quize_app_space_hack/providers/quiz_provider.dart';
import 'package:quize_app_space_hack/screens/quize_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<QuizProvider>();
    return Scaffold(
      body: SizedBox.expand(
        child: GradientBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Space Tour',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
              SizedBox(height: 40),
              if (provider.questions.isEmpty || provider.totalTime == 0)
                Center(
                  child: CircularProgressIndicator(),
                )
              else
                ActionButton(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => QuizScreen(
                          totalTime: provider.totalTime,
                          questions: provider.questions,
                        ),
                      ),
                    );
                  },
                  title: 'Start',
                ),
              SizedBox(height: 20),
              Text(
                'Total Questions: ${provider.questions.length}',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 70),
              RankAuthButton()
            ],
          ),
        ),
      ),
    );
  }
}