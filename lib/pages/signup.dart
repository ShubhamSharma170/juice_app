import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:juice_delivery_app/routes/route_name.dart';
import 'package:juice_delivery_app/services/firebase_method.dart';
import 'package:juice_delivery_app/services/shared_preference.dart';
import 'package:juice_delivery_app/services/support_widget.dart';
import 'package:random_string/random_string.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  String? fullName, email, password;

  registration() async {
    setState(() {
      isLoading = true;
    });
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      String id = randomAlphaNumeric(10);
      Map<String, dynamic> userData = {
        "name": fullNameController.text.trim(),
        "email": emailController.text.trim(),
        "id": id,
        "points": "0",
      };
      await FirebaseMethod.saveUserDataToFirebase(userData, id);
      SharedPreferenceClass.saveUserName(fullNameController.text.trim());
      SharedPreferenceClass.saveUserId(id);
      SharedPreferenceClass.setUserEmail(emailController.text.trim());
      SharedPreferenceClass.saveUserPoint("0");
      if (!mounted) return;
      setState(() {
        isLoading = false;
      });
      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteName.home,
        (_) => false,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        AppWidgets.customTostGreenMessage("Account Created SuccessFully"),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          AppWidgets.customTostRedMessage(
            "The email address is already in use by another account.",
          ),
        );
      }
      if (e.code == "weak-password") {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          AppWidgets.customTostRedMessage("The password provided is too weak."),
        );
      }
      setState(() {
        isLoading = false;
      });
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
                    "Create\nAccount",
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
                    controller: fullNameController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Full Name",
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
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Password",
                      hintStyle: AppWidgets.headlineTextStyle(16),
                    ),
                  ),
                ),
                SizedBox(height: 60),
                InkWell(
                  onTap: isLoading
                      ? () {}
                      : () {
                          registration();
                        },
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
                          child: isLoading
                              ? CircularProgressIndicator(color: Colors.white)
                              : Text(
                                  "Sign Up",
                                  style: AppWidgets.whiteTextStyle(18),
                                ),
                        ),
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: AppWidgets.headlineTextStyle(18),
                    ),
                    SizedBox(width: 5),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Login",
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
