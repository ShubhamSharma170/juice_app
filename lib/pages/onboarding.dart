import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:juice_delivery_app/routes/route_name.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  initState() {
    Future.delayed(Duration(seconds: 3), () {
      if (mounted) {
        FirebaseAuth.instance.currentUser == null ?
        Navigator.pushReplacementNamed(context, RouteName.login):Navigator.pushReplacementNamed(context, RouteName.navigation);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        "images/background_image.jpg",
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
