// ignore_for_file: unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:juice_delivery_app/pages/bottom_navigation/bottom_navigation.dart';
import 'package:juice_delivery_app/pages/home.dart';
import 'package:juice_delivery_app/pages/juice.dart';
import 'package:juice_delivery_app/pages/auth/login.dart';
import 'package:juice_delivery_app/pages/onboarding.dart';
import 'package:juice_delivery_app/pages/auth/signup.dart';
import 'package:juice_delivery_app/provider/auth_provider/login_provider.dart';
import 'package:juice_delivery_app/routes/routes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => LoginProvider())],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Juice Delivery App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const OnboardingPage(),
      onGenerateRoute: (settings) => Routes.createRoute(settings),
    );
  }
}
