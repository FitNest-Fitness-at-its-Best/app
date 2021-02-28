import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../utils/global_themes.dart';

import 'bmi.dart';

class ExtraInfoScreen extends StatefulWidget {
  static const routename = "/signupextras";

  @override
  _ExtraInfoScreenState createState() => _ExtraInfoScreenState();
}

class _ExtraInfoScreenState extends State<ExtraInfoScreen> {
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
          onPressed: ()=>Navigator.of(context).pushReplacementNamed(BMIScreen.routename),
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
                'Please tell us your height, weight and DOB',
                style: bigText.copyWith(fontSize: 22),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _heightController,
                      decoration: InputDecoration(
                        hintText: 'HEIGHT',
                        hintStyle: defaultText,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'CM',
                    style: defaultText,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _weightController,
                      decoration: InputDecoration(
                        hintText: 'WEIGHT',
                        hintStyle: defaultText,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'KG',
                    style: defaultText,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  RaisedButton(
                    elevation: 0,
                    onPressed: () async {
                      final DateTime picked = await showDatePicker(
                        context: context,
                        initialDate: _birthDate ?? DateTime.now(), // Refer step 1
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                        builder: (context, child) {
                          return Theme(
                            data: ThemeData.light().copyWith(
                              colorScheme: ColorScheme.light().copyWith(
                                primary: primaryColor,
                              ),
                            ),
                            child: child,
                          );
                        },
                      );
                      if (picked != null && picked != _birthDate)
                        setState(() {
                          _birthDate = picked;
                        });
                    },
                    textColor: Colors.white,
                    child: Text('SELECT DOB'),
                  ),
                  Spacer(),
                  Text(
                    _birthDate != null ? format.format(_birthDate) : '',
                    style: defaultText,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
