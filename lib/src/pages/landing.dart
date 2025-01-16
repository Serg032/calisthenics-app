import 'package:calistenics_app/src/pages/sign_up.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  void goToSignUp(BuildContext context) {
    print('sign up');
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const SignUpFormPage()));
  }

  void goToSignIn() {
    print('sign in');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: (Column(
            spacing: 30,
            children: [
              ElevatedButton(
                  onPressed: () => goToSignUp(context), child: Text('Sign up')),
              ElevatedButton(onPressed: goToSignIn, child: Text('Sign in')),
            ],
          )),
        )
      ],
    );
  }
}
