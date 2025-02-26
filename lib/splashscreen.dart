import 'package:flutter/material.dart';

import 'package:spot_on_users/get_startedpage.dart';

class SpotOnSplashScreen extends StatefulWidget {
  const SpotOnSplashScreen({super.key});

  @override
  State<SpotOnSplashScreen> createState() => _LaundrySplashScreenState();
}

@override
class _LaundrySplashScreenState extends State<SpotOnSplashScreen> {
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => GetStartedpage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Laundry Icon
              Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                      child: Image.network(
                    'https://img.freepik.com/free-vector/parking-concept-illustration_114360-9286.jpg',
                  ))),
              // Space between icon and text
              const SizedBox(height: 16),

              // Laundry Text
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Spot',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: 'On',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                  ],
                ),
              ),

              // Progress Indicator at bottom
              const Padding(
                padding: EdgeInsets.only(top: 200),
                child: LinearProgressIndicator(
                  backgroundColor: Colors.purple,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                  minHeight: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
