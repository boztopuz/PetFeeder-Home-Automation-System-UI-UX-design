import 'package:flutter/material.dart';
import 'package:pet_feeder/screens/email_form_page.dart';
import 'package:pet_feeder/screens/home_page.dart';

import 'package:pet_feeder/service/auth.dart';
import 'package:pet_feeder/widgets/sign_in_button.dart';
import 'package:pet_feeder/widgets/social_sign_in_button.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);
  final AuthBase auth = Auth();

  Future<void> _signInAnonymously(BuildContext context) async {
    try {
      await auth.signInAnonymously();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: ((context) => HomePage()),
        ),
      );
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      await auth.signInWithGoogle();
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: ((context) => HomePage()),
      ));
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Center(
            child: Text(
              "Pet Feeder",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SocialSignInButton(
                text: "Sign in with Google",
                imgUrl: "assets/images/google-logo.png",
                textColor: Colors.black,
                color: Colors.white,
                onPressed: () {
                  _signInWithGoogle(context);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              SocialSignInButton(
                imgUrl: 'assets/images/email.png',
                text: "Sign in with Email",
                textColor: Colors.black,
                color: Colors.indigo.shade400,
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: ((context) => EmailFormPage()),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "OR",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 8,
              ),
              SignInButton(
                text: "Go Anonymous",
                textColor: Colors.black,
                color: Colors.orange,
                onPressed: () {
                  _signInAnonymously(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
