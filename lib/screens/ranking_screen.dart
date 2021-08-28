import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quize_app_space_hack/components/gradient_box.dart';
class RankingScreen extends StatelessWidget {
  const RankingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBox(
        child:Padding(
          padding: EdgeInsets.all(8.0),
          child:  Column(
            children: [
               SizedBox(height: 40.0,),
              Text('Ranking',style: TextStyle(fontSize: 40.0,color: Colors.white,fontWeight: FontWeight.bold),),
              SizedBox(height: 40.0,),

              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('users').snapshots(),
                  builder: (context,snapshot){
                    if(!snapshot.hasData)
                      return Center(
                        child: CircularProgressIndicator() ,

                      );

                    final users = snapshot.data!.docs;
                    return ListView.builder(
                      itemBuilder: (context , index){
                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage:NetworkImage(users[index]['photoUrl'])
                            ),
                            title: Text(users[index]['name']),
                            trailing: Text(users[index]['score'].toString(),style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),
                          ),
                        );

                      },
                      itemCount: users.length,
                    );

                  },
                )
              )

            ],
          ) ,
        )
      ),
    );
  }
}
