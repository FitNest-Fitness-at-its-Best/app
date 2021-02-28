import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../data/models/user.dart';
import '../../services/bloc/sign_in/googlesignin_bloc.dart';
import '../../utils/global_themes.dart';
import 'signup/signup_screen_goog.dart';

class ProfileScreen extends StatelessWidget {
  static const routename = "/profile";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GooglesigninBloc(),
      child: ProfileScreenBuilder(),
    );
  }
}

class ProfileScreenBuilder extends StatefulWidget {
  @override
  _ProfileScreenBuilderState createState() => _ProfileScreenBuilderState();
}

class _ProfileScreenBuilderState extends State<ProfileScreenBuilder> {
  UserClass user = UserClass.fromJson(Hive.box("userBox").get("user"));
  bool loading = false;

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.grey,
            ),
            onPressed: () => Navigator.maybePop(context),
          )
        ],
        title: Text("fitnest"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: 32,
            vertical: 32,
          ),
          child: BlocListener<GooglesigninBloc, GooglesigninState>(
            listener: (context, state) {
              if (state is LoginLoading) {
                setState(() {
                  loading = true;
                });
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Hero(
                      tag: "profile_pic",
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(Hive.box("userBox").get("photo_url")),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '${user.username}',
                            overflow: TextOverflow.ellipsis,
                            style: boldHeading.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                RichText(
                  text: TextSpan(
                    style: greyText.copyWith(
                      fontFamily: "Montserrat",
                    ),
                    children: [
                      TextSpan(
                        text: "Email: ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(text: "${user.email}"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).canvasColor,
        elevation: 0,
        child: Padding(
          padding: EdgeInsets.all(32),
          child: RaisedButton(
            onPressed: () {
              GooglesigninBloc().add(Logout());
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(SignupScreen.routename, (route) => false);
            },
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: Text('LOGOUT'),
            ),
            textColor: Colors.white,
            elevation: 0,
          ),
        ),
      ),
    );
  }
}
