import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:juice_delivery_app/services/firebase_method.dart';
import 'package:juice_delivery_app/services/shared_preference.dart';

class SignupProvider with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  setLoading(value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<bool> registration(String email, password, name) async {
    setLoading(true);

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      String id = userCredential.user!.uid;
      Map<String, dynamic> userData = {
        "name": name,
        "email": email,
        "id": id,
        "points": "0",
      };
      await FirebaseMethod.saveUserDataToFirebase(userData, id);
      SharedPreferenceClass.saveUserName(name);
      SharedPreferenceClass.saveUserId(id);
      SharedPreferenceClass.setUserEmail(email);
      SharedPreferenceClass.saveUserPoint("0");
      setLoading(false);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {}
      if (e.code == "weak-password") {}
      setLoading(false);
      rethrow;
    } catch (e) {
      setLoading(false);
      return false;
    }
  }
}
