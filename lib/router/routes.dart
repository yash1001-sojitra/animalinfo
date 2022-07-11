import 'package:animalinformation/Authentication/signinpage.dart';
import 'package:animalinformation/Authentication/signuppage.dart';
import 'package:animalinformation/core/constant/string.dart';
import 'package:animalinformation/user/homescreen/homepage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../onboardingandspalshscreen/onboardingscreen.dart';
import '../onboardingandspalshscreen/splashscreen.dart';

class Routes {
  late int initScreen;
  Future<void> checkForOnBordScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    initScreen = prefs.getInt("initScreen")!;
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreenRoute:
        return MaterialPageRoute(builder: (context) => SplashScreen());

      case onboardingScreenRoute:
        return MaterialPageRoute(builder: (context) => OnboardingScreen());

      case singInScreenRoute:
        return MaterialPageRoute(builder: (context) => SignInpage());

      case signUpScreenRoute:
        return MaterialPageRoute(builder: (context) => const SignupPage());

      case homepageScreenRoute:
        return MaterialPageRoute(builder: (context) => const HomePage());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
