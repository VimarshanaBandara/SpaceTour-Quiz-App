import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quize_app_space_hack/providers/quiz_provider.dart';
import 'package:quize_app_space_hack/screens/home_screen.dart';
import 'package:quize_app_space_hack/splash_screen.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    
    ChangeNotifierProvider(create:(_)=> QuizProvider(),
    child: MyApp(),
    ),
    
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

