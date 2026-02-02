import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseMethod {
  static saveUserDataToFirebase(
    Map<String, dynamic> userData,
    String id,
  ) async {
    await FirebaseFirestore.instance.collection("users").doc(id).set(userData);
  }

  static addUserOrder(String id, Map<String, dynamic> orderData) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .collection("orders")
        .add(orderData);
  }

  static addAdminOrder(Map<String, dynamic> adminOrderData) async {
    await FirebaseFirestore.instance
        .collection("adminOrders")
        .add(adminOrderData);
  }

  static updateUserPoints(String id, String points) async {
    await FirebaseFirestore.instance.collection("users").doc(id).update({
      "points": points,
    });
  }
}
