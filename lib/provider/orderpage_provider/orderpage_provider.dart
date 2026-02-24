import 'package:flutter/material.dart';

class OrderpageProvider with ChangeNotifier {
  Stream? _orderStream;

  get orderStream => _orderStream;

  setOrderStream(val) {
    _orderStream = val;
    notifyListeners();
  }
}
