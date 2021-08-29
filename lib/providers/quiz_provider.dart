import 'package:flutter/material.dart';
import 'package:quize_app_space_hack/models/question.dart';
import 'package:quize_app_space_hack/models/quiz_user.dart';
import 'package:quize_app_space_hack/services/quiz_service.dart';


class QuizProvider extends ChangeNotifier {
  int totalTime = 0;
  List<Question> questions = [];
  List<QuizUser> users = [];

  QuizProvider() {
    QuizService.getAllQuestions().then((value) {
      questions = value;
      notifyListeners();
    });

    QuizService.getTotalTime().then((value) {
      totalTime = value;
      notifyListeners();
    });
  }

  Future<void> getAllUsers() async {
    users = await QuizService.getAllUsers();
    notifyListeners();
  }

  Future<void> updateHighscore(int currentScore) async {
    await QuizService.updateHighscore(currentScore);
  }
}