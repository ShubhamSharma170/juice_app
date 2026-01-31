import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseMethod {
  static saveUserDataToFirebase(Map<String, dynamic> userData,String id)async{
    await FirebaseFirestore.instance.collection("users").doc(id).set(userData);
  } 
}