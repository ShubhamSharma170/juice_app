import 'package:flutter/material.dart';

class AppWidgets {
  static headlineTextStyle(double size, {Color? colors}) {
    return TextStyle(
      color: colors ?? Colors.black,
      fontSize: size,
      fontFamily: "Poppins",
    );
  }

  static whiteTextStyle(double size) {
    return TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w600,
    );
  }

  static colorTextStyle(double size) {
    return TextStyle(
      color: Color(0xffb900e7),
      fontSize: 18,
      fontFamily: "Poppins",
      fontWeight: FontWeight.bold,
    );
  }

  static customTostRedMessage(String msg) {
    return SnackBar(
      content: Text(
        msg,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontFamily: "Poppins",
        ),
      ),
      backgroundColor: Colors.red,
    );
  }

  static customTostGreenMessage(String msg) {
    return SnackBar(
      content: Text(
        msg,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontFamily: "Poppins",
        ),
      ),
      backgroundColor: Colors.green,
    );
  }
}
