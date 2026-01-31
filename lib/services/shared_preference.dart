import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceClass {
  static saveUserId(String id) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    Future<bool> result = pref.setString("USERID", id);
    return result;
  }

  static saveUserName(String name)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    Future<bool> result = pref.setString("USERNAME", name);
    return result;
  }
   static setUserEmail(String email)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    Future<bool> result = pref.setString("USEREMAIL", email);
    return result;
   }
   static saveUserPoint(String points)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    Future<bool> result = pref.setString("USERPOINTS", points);
    return result;
   }
}
