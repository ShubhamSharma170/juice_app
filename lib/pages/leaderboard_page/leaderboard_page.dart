import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:juice_delivery_app/provider/leaderboard_provider/leaderboard_provider.dart';
import 'package:juice_delivery_app/services/firebase_method.dart';
import 'package:juice_delivery_app/services/shared_preference.dart';
import 'package:juice_delivery_app/services/support_widget.dart';
import 'package:provider/provider.dart';

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({super.key});

  @override
  State<LeaderboardPage> createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  String? points;
  // Stream? leaderBoardStream;
  @override
  initState() {
    getLeaderBoardStream();
    super.initState();
  }

  getLeaderBoardStream() async {
    final provider = Provider.of<LeaderboardProvider>(listen: false, context);
    points = await SharedPreferenceClass.getUserPoints();
    provider.setLeaderBoard(FirebaseMethod.leaderBoardStream());
    // leaderBoardStream = FirebaseMethod.leaderBoardStream();
    // setState(() {});
  }

  Widget leaderBoardPoints(leaderBoardStream) {
    return StreamBuilder(
      stream: leaderBoardStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    child: Material(
                      clipBehavior: Clip.antiAlias,
                      elevation: 5,
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(color: Colors.white),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              ds['name'],
                              style: AppWidgets.headlineTextStyle(22),
                            ),
                            Text(
                              ds['points'],
                              style: AppWidgets.headlineTextStyle(22),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            : Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<LeaderboardProvider>(
          builder: (ctx, provider, child) => Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  "Points Page",
                  style: AppWidgets.headlineTextStyle(30),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.pink[100],
                    ),
                    child: Row(
                      children: [
                        Image.asset("images/coin.png", height: 80, width: 80),
                        SizedBox(width: 30),
                        Column(
                          children: [
                            Text(
                              "Points  Earned",
                              style: AppWidgets.headlineTextStyle(20),
                            ),
                            SizedBox(height: 10),
                            Text(
                              points ?? "Not Available",
                              style: AppWidgets.headlineTextStyle(23),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Stack(
                children: [
                  Image.asset(
                    "images/water.png",
                    height: MediaQuery.of(context).size.height / 1.5,
                  ),
                  Center(
                    child: Text(
                      "LeaderBoard",
                      style: AppWidgets.headlineTextStyle(20),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: leaderBoardPoints(provider.leaderBoardStream),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
