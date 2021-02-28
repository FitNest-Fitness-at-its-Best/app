import 'package:flutter/material.dart';

import '../../../utils/global_themes.dart';
import 'signup_screen_goog.dart';

class IntroScreen extends StatelessWidget {
  static const routename = "/intro";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: accentColor,
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 40),
        child: RaisedButton(
          elevation: 0,
          onPressed: () => Navigator.of(context).pushReplacementNamed(SignupScreen.routename),
          child: Container(
            margin: EdgeInsets.all(16),
            child: Text(
              'CONTINUE',
              style: defaultText,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.2,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: accentColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(166),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 24),
                padding: EdgeInsets.all(30),
                child: Text(
                  'Making Fitness accessible for all',
                  style: bigText,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.13,
              left: MediaQuery.of(context).size.width * 0.3,
              child: Image.asset(
                "assets/images/logo.png",
                height: 150,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
