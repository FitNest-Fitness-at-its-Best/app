import 'package:fitnest/src/presentation/screens/signup/extras.dart';
import 'package:fitnest/src/presentation/screens/signup/intro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'src/presentation/screens/home_screen.dart';
import 'src/presentation/screens/signup/signup_screen_goog.dart';
import 'src/presentation/screens/signup/bmi.dart';
import 'src/presentation/screens/splash.dart';
import 'src/utils/global_themes.dart';

void main() async {
  //ensure binding with widgets
  WidgetsFlutterBinding.ensureInitialized();

  //portrait lock
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  //transparent status theme with dark icons
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
  ));

  //init hive
  final dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  await Hive.openBox("userBox");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: appThemeData,
      title: 'Fitnest',
      home: SplashScreen(),
      routes: {
        SignupScreen.routename: (_) => SignupScreen(),
        IntroScreen.routename: (_) => IntroScreen(),
        ExtraInfoScreen.routename: (_) => ExtraInfoScreen(),
        HomeScreen.routename: (_) => HomeScreen(),
        BMIScreen.routename: (_) => BMIScreen(),
      },
    );
  }
}
