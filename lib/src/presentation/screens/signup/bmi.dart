import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../utils/global_themes.dart';

class BMIScreen extends StatefulWidget {
  static const routename = "/bmi";

  @override
  _BMIScreenState createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  TextEditingController _heightController;
  TextEditingController _weightController;
  DateTime _birthDate;
  var format = DateFormat.yMd();

  @override
  void initState() {
    _heightController = TextEditingController();
    _weightController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _heightController.dispose();
    _weightController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: accentColor,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: accentColor,
          // gradient: LinearGradient(
          //   colors: [
          //     Colors.transparent,
          //     Colors.black12,
          //   ],
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          // ),
        ),
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 40),
        child: RaisedButton(
          elevation: 0,
          onPressed: () {},
          child: Container(
            margin: EdgeInsets.all(16),
            child: Text(
              'I AM READY',
              style: defaultText,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Text(
                'Welcome',
                style: TextStyle(
                  color: brown,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Siddhartha',
                style: bigText,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Text(
                'Ready to begin a journey towards a healthier lifestyle?',
                style: bigText.copyWith(fontSize: 22),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Center(
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.height * 0.2,
                  child: Container(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
