import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../services/bloc/sign_in/googlesignin_bloc.dart';
import '../../../utils/global_themes.dart';
import '../../../utils/global_themes.dart';
import '../../../utils/global_themes.dart';
import '../../../utils/global_themes.dart';
import '../../../utils/global_themes.dart';
import '../../widgets/my_snackbar.dart';
import '../../widgets/show_up.dart';
import '../home_screen.dart';
import 'extras.dart';

class SignupScreen extends StatelessWidget {
  static const routename = "/signup";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GooglesigninBloc(),
      child: SignupScreenBuilder(),
    );
  }
}

class SignupScreenBuilder extends StatefulWidget {
  @override
  _SignupScreenBuilderState createState() => _SignupScreenBuilderState();
}

class _SignupScreenBuilderState extends State<SignupScreenBuilder> {
  GooglesigninBloc _googlesigninBloc;

  @override
  void initState() {
    _googlesigninBloc = BlocProvider.of<GooglesigninBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    _googlesigninBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: accentColor,
      body: SafeArea(
        child: BlocConsumer<GooglesigninBloc, GooglesigninState>(
            // cubit: _googlesigninBloc,
            listener: (context, state) {
          if (state is Authenticated) {
            Scaffold.of(context).showSnackBar(getMySnackBar("Login Successful"));
            Future.delayed(
              Duration(seconds: 1),
              () => Navigator.of(context).pushReplacementNamed(HomeScreen.routename),
            );
          } else if (state is Unauthenticated) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (ctx) => AlertDialog(
                title: Text('Error'),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                content: Text(state.message),
                actions: <Widget>[
                  FlatButton(
                    child: Text('UNDERSTOOD'),
                    textColor: primaryColor,
                    onPressed: () => Navigator.of(context).maybePop(),
                  ),
                ],
              ),
            );
          }
        }, builder: (context, state) {
          return buildUI(context, state);
        }),
      ),
    );
  }

  Widget buildUI(BuildContext context, GooglesigninState state) {
    return Container(
      padding: EdgeInsets.all(16),
      alignment: Alignment.center,
      child: buildColumn(state, context),
    );
  }

  Column buildColumn(GooglesigninState state, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ShowUp(
          delay: Duration(milliseconds: 200),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/images/logo.png",
                height: 108,
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                'FITNEST',
                style: bigText.copyWith(
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 60,
        ),
        ShowUp(
          delay: Duration(milliseconds: 300),
          child: Text(
            'LOGIN',
            style: bigText.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        ShowUp(
          delay: Duration(milliseconds: 400),
          child: (state is LoginLoading)
              ? Center(
                  child: LinearProgressIndicator(
                    backgroundColor: primaryColor,
                  ),
                )
              : Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: RaisedButton(
                    onPressed: () {
                      // _googlesigninBloc.add(Login());
                      // print("logged in");
                      Navigator.of(context).pushReplacementNamed(ExtraInfoScreen.routename);
                    },
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: borderRadiusButton,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('LOGIN WITH GOOGLE'),
                        SizedBox(
                          width: 20,
                        ),
                        Image.network(
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/1004px-Google_%22G%22_Logo.svg.png",
                          fit: BoxFit.contain,
                          height: 24,
                        )
                      ],
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
