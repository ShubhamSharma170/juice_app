import 'package:flutter/material.dart';
import 'package:juice_delivery_app/pages/home.dart';
import 'package:juice_delivery_app/pages/juice.dart';
import 'package:juice_delivery_app/pages/login.dart';
import 'package:juice_delivery_app/pages/onboarding.dart';
import 'package:juice_delivery_app/pages/signup.dart';
import 'package:juice_delivery_app/routes/route_name.dart';

class Routes {
  static Route<dynamic> createRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.onboarding:
        return MaterialPageRoute(
          builder: (BuildContext context) => OnboardingPage(),
        );
      case RouteName.juicePage:
        var arguments = settings.arguments as String;
        return MaterialPageRoute(
          builder: (BuildContext context) => JuicePage(type: arguments,),
        );
      case RouteName.signup:
        return MaterialPageRoute(builder: (context) => SignUp());
      case RouteName.login:
        return MaterialPageRoute(builder: (context) => Login());
      case RouteName.home:
        return MaterialPageRoute(builder: (context) => HomePage());
      default:
        return MaterialPageRoute(
          builder: (BuildContext context) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
