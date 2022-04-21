import 'package:flutter/material.dart';
import 'package:pet_feeder/screens/sign_in_page.dart';
import 'package:pet_feeder/service/auth.dart';
import 'package:pet_feeder/widgets/gram_meter.dart';

import '../widgets/gauge_meter.dart';
import '../widgets/time_select.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  final AuthBase auth = Auth();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool systemOn = false;
  bool _isFeeded = false;

  void _isFeed() async {
    _setFeeded(true);
    await Future.delayed(
      const Duration(milliseconds: 250),
    );
    _setFeeded(false);
  }

  void _setFeeded(bool isFeeded) {
    setState(() {
      _isFeeded = isFeeded;
    });
  }

  Future<void> _signOut(BuildContext context) async {
    try {
      await widget.auth.signOut();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => SignInPage()),
      );
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: _buildDrawer(context),
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () => _signOut(context),
                child: const Text(
                  "Log Out",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
          title: const Text(
            "Pet Feeder",
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: scrollPage(),
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo.shade400,
            ),
            child: Text(
              "${widget.auth.currentUser.displayName}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            title: const Text('Profile Settings'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Log Out'),
            onTap: () {
              Navigator.pop(context);
              _signOut(context);
            },
          ),
        ],
      ),
    );
  }

  Widget scrollPage() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 60,
            child: ElevatedButton(
              child: Text(
                systemOn ? "System On" : "System Off",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 2, color: Colors.red),
                  borderRadius: BorderRadius.circular(30),
                ),
                primary: systemOn ? Colors.red : Colors.white,
              ),
              onPressed: () {
                setState(() {
                  systemOn = !systemOn;
                });
              },
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const GaugeMeter(),
          SizedBox(
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: _isFeeded ? Colors.indigo : Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    width: 2,
                    color: Colors.indigo,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                "Feed Now",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: _isFeeded ? Colors.white : Colors.indigo),
              ),
              onPressed: _isFeed,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Weight in Grams",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          const GramMeter(),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Meal Time Controller",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              TimeWidget(
                mealTime: "Meal 1",
              ),
              SizedBox(
                width: 4,
              ),
              TimeWidget(
                mealTime: "Meal 2",
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              TimeWidget(
                mealTime: "Meal 3",
              ),
              SizedBox(
                width: 4,
              ),
              TimeWidget(
                mealTime: "Meal 4",
              ),
            ],
          )
        ],
      ),
    );
  }
}
