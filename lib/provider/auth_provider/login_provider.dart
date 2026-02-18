import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
      setLoading(false);
      return true;
    } on FirebaseAuthException catch (e) {
      setLoading(false);
      rethrow;
    } catch (e) {
      setLoading(false);
      return false;
    }
  }
}
