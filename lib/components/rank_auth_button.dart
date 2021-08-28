import 'package:flutter/material.dart';
import 'package:quize_app_space_hack/components/action_button.dart';
import 'package:quize_app_space_hack/services/auth_service.dart';

class RankAuthButton extends StatefulWidget {
  const RankAuthButton({Key? key}) : super(key: key);

  @override
  _RankAuthButtonState createState() => _RankAuthButtonState();
}

class _RankAuthButtonState extends State<RankAuthButton> {

  bool isLoggedId = false;


  @override
  Widget build(BuildContext context) {
    if(isLoggedId) return ActionButton(
      title: 'Ranking',
      onTap: (){},
    );


    return ActionButton(
        isPrimary: false,
        title: 'Sign in with Google',
        onTap: (){
          AuthService.signInWithGoogle();
        }
    );


  }
}
