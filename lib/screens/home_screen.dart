import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(

                image: DecorationImage(
                  image: AssetImage('images/bg2.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop),
                )
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40.0,),
                  Text(
                    'Space Tour',style: GoogleFonts.shrikhand(color: Colors.white,fontSize: 40.0,shadows: <Shadow>[
                    Shadow(
                      offset: Offset(2.0, 2.0),
                      blurRadius: 3.0,
                      color: Colors.black87,
                    ),
                    Shadow(
                      offset: Offset(2.0, 2.0),
                      blurRadius: 8.0,
                      color: Colors.black87,
                    ),
                  ],),),
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
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(height: 70),
                  RankAuthButton()
                ],
              ),
            )
        )
      );

  }
}