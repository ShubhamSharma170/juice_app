import 'package:flutter/material.dart';
import 'package:juice_delivery_app/pages/home.dart';
import 'package:juice_delivery_app/pages/leaderboard_page/leaderboard_page.dart';
import 'package:juice_delivery_app/pages/order_page/order_page.dart';
import 'package:juice_delivery_app/profile/profile_page.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({super.key});

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int _selectedIndex = 0;

  final List _pages = [
    HomePage(),
    OrderPage(),
    LeaderboardPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() {
          _selectedIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.online_prediction_rounded, color: Colors.black),
            label: "Order",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.score, color: Colors.black),
            label: "Score",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.accessibility_outlined, color: Colors.black),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
