import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pet_feeder/screens/home_page.dart';
import 'package:pet_feeder/screens/sign_in_page.dart';

class LandingPage extends StatefulWidget {
  LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool isCurrentUser = false;
  @override
  void initState() {
    super.initState();
    initializedFirebase();
  }

  Future<void> initializedFirebase() async {
    if (FirebaseAuth.instance.currentUser != null) {
      setState(() {
        isCurrentUser = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isCurrentUser ? HomePage() : SignInPage();
  }
}
