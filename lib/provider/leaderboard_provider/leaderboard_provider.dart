import 'package:flutter/material.dart';

class LeaderboardProvider with ChangeNotifier {
  Stream? _leaderBoardStream;

  get leaderBoardStream => _leaderBoardStream;

  setLeaderBoard(val) {
    _leaderBoardStream = val;
    notifyListeners();
  }
}
