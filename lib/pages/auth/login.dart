import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:juice_delivery_app/provider/auth_provider/login_provider.dart';
import 'package:juice_delivery_app/routes/route_name.dart';
import 'package:juice_delivery_app/services/support_widget.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  loginMethod() async {
    final loginPov = Provider.of<LoginProvider>(context, listen: false);
    try {
      bool success = await loginPov.loginAction(
        emailController.text.trim(),
        passwordController.text.trim(),
      );
      if (success && mounted) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          RouteName.home,
          (_) => false,
        );
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(AppWidgets.customTostGreenMessage("Login Successful"));
      }
    } on FirebaseAuthException catch (e) {
      log(e.message!);
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(AppWidgets.customTostRedMessage(e.code));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              "images/bg.png",
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.fill,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Text(
                    "Welcome\nBack",
                    style: AppWidgets.headlineTextStyle(40),
                  ),
                ),
                SizedBox(height: 150),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Email",
                      hintStyle: AppWidgets.headlineTextStyle(16),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Password",
                      hintStyle: AppWidgets.headlineTextStyle(16),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgot Password?",
                        style: AppWidgets.headlineTextStyle(18),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 60),
                Consumer<LoginProvider>(
                  builder: (ctx, provider, child) {
                    return InkWell(
                      onTap: () =>
                          provider.isLoading ? null : () => loginMethod(),
                      child: Center(
                        child: Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Color(0xffb900e7),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: provider.isLoading
                                  ? CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : Text(
                                      "Login",
                                      style: AppWidgets.whiteTextStyle(18),
                                    ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),

                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: AppWidgets.headlineTextStyle(18),
                    ),
                    SizedBox(width: 5),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, 'signup');
                      },
                      child: Text(
                        "Sign Up",
                        style: AppWidgets.colorTextStyle(18),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
