import 'package:flutter/material.dart';
import 'dart:async';

import 'package:quize_app_space_hack/screens/home_screen.dart';



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    super.initState();
    displaySplash();
  }

  displaySplash(){

    Timer(Duration(seconds: 7), () async{



      Route route = MaterialPageRoute(builder: (_) => HomeScreen());
      Navigator.pushReplacement(context, route);


    });

  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [

          Container(

            decoration:   BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/bg3.jpg'),
                    fit: BoxFit.cover
                )

            ),

          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Padding(
                        padding: EdgeInsets.only(top: 70.0),

                      ),
                      Text("Welcome",style: TextStyle(color: Colors.white70,fontSize: 35.0,fontWeight: FontWeight.bold ,fontFamily:'gfont',
                      ),
                      ),
                    ],
                  ),
                ),

              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [




                    Text("Space Tour",style: TextStyle(color: Colors.white,fontSize: 30.0,fontWeight: FontWeight.bold,
                    ),
                    ),



                    Text("Powered by  Rocket Fellows",style: TextStyle(color: Colors.white,fontSize: 25.0,fontWeight: FontWeight.bold,

                    ),
                    ),


                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}