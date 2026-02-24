import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:juice_delivery_app/services/shared_preference.dart';

class LoginProvider with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<bool> loginAction(String email, String pass) async {
    setLoading(true);
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass);
      String id = userCredential.user!.uid;
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(id)
          .get();
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      log("checking points  ${data['points']}");
      String points = data['points'];
      String userName = data['name'];
      SharedPreferenceClass.saveUserPoint(points);
      SharedPreferenceClass.saveUserName(userName);
      log("check user uid");
      log(userCredential.user!.uid);
      setLoading(false);
      return true;
    } on FirebaseAuthException {
      setLoading(false);
      rethrow;
    } catch (e) {
      setLoading(false);
      return false;
    }
  }
}
