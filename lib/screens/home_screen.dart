import 'package:cloud_firestore/cloud_firestore.dart';
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

              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('questions').snapshots() ,
                builder:(context , snapshot) {

                  if(!snapshot.hasData){
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  final questionDocs = snapshot.data!.docs;

                  final questions = questionDocs.map((e) => Question.fromQueryDocumentSnapshot(e)).toList();



                 return StreamBuilder<QuerySnapshot>(
                   stream: FirebaseFirestore.instance.collection('config').snapshots(),
                   builder:(context , snapshot){

                    if(!snapshot.hasData){
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    final configDoc = snapshot.data!.docs.first.data() as Map<String , dynamic>;
                    final totalTime = configDoc['key'];

                    return  Column(
                      children: [
                        ActionButton(
                          onTap:(){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>QuizScreen(
                              totalTime:totalTime ,
                              questions:questions,
                            )));
                          } ,
                          title: 'Start',
                        ),
                        SizedBox(height: 40.0,),
                        Text('Total Questions : ${questions.length} ',style: TextStyle(color: Colors.white , fontSize: 25.0),)

                      ],
                    );



                 } ,);







                }



              ,),



            ],
          ),
        )
      )
    );
  }
}


