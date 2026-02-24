// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:juice_delivery_app/provider/juice_page_provider/juicepage_provider.dart';
import 'package:juice_delivery_app/services/firebase_method.dart';
import 'package:juice_delivery_app/services/shared_preference.dart';
import 'package:juice_delivery_app/services/support_widget.dart';
import 'package:provider/provider.dart';

class JuicePage extends StatefulWidget {
  String type;
  JuicePage({required this.type, super.key});

  @override
  State<JuicePage> createState() => _JuicePageState();
}

class _JuicePageState extends State<JuicePage> {
  String? id;
  String? userName, points;
  // int sugarCount = 0;
  TextEditingController notesController = TextEditingController();

  getDataOnLoad() async {
    id = FirebaseAuth.instance.currentUser!.uid;
    userName = await SharedPreferenceClass.getUserName();
    points = await SharedPreferenceClass.getUserPoints();
    log(id!);
    log(userName!);
    log(points!);
  }

  @override
  initState() {
    log(widget.type);
    getDataOnLoad();
    super.initState();
  }

  void _paymentSuccess(String fruit1, fruit2, fruit3, int sugarCount) async {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(AppWidgets.customTostGreenMessage("Payment Successful "));
    Map<String, dynamic> orderData = {
      "SugarCount": sugarCount,
      "SelectedFruit1": fruit1,
      "SelectedFruit2": fruit2,
      "SelectedFruit3": fruit3,
      "Notes": notesController.text,
      "UserName": userName,
      "Amount": "50",
      "Delivered": "false",
      "type": widget.type,
    };

    int updatedPoints = int.parse(points!) + 20;
    SharedPreferenceClass.saveUserPoint(updatedPoints.toString());
    log("updated points is $updatedPoints");
    await FirebaseMethod.addUserOrder(id!, orderData);
    await FirebaseMethod.addAdminOrder(orderData);
    await FirebaseMethod.updateUserPoints(id!, updatedPoints.toString());
  }

  void _paymentSuccessWithPoints(
    String fruit1,
    fruit2,
    fruit3,
    int sugarCount,
  ) async {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(AppWidgets.customTostGreenMessage("Payment Successful "));
    Map<String, dynamic> orderData = {
      "SugarCount": sugarCount,
      "SelectedFruit1": fruit1,
      "SelectedFruit2": fruit2,
      "SelectedFruit3": fruit3,
      "Notes": notesController.text,
      "UserName": userName,
      "Amount": "50",
      "Delivered": "false",
      "type": widget.type,
    };

    int updatedPoints = int.parse(points!) - 40;
    SharedPreferenceClass.saveUserPoint(updatedPoints.toString());
    log("updated points is $updatedPoints");
    await FirebaseMethod.addUserOrder(id!, orderData);
    await FirebaseMethod.addAdminOrder(orderData);
    await FirebaseMethod.updateUserPoints(id!, updatedPoints.toString());
  }

  // final List<String> fruits = [
  //   "images/tomato.png",
  //   "images/watermelon.png",
  //   "images/pineapple.png",
  //   "images/banana.png",
  //   "images/apple.png",
  // ];

  // String? selectedFruit1 = "images/tomato.png";
  // String? selectedFruit2 = "images/tomato.png";
  // String? selectedFruit3 = "images/tomato.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Consumer<JuicePageProvider>(
          builder: (ctx, provider, child) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 60),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Color(0xffebfbfe)),
                child: Image.asset("images/mixer.png", height: 230),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Choose Fruit To Mix",
                  style: AppWidgets.headlineTextStyle(20),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _fruitDropdown(provider.selectedFruit1, (val) {
                    provider.setFruit1(val);
                  }),
                  _fruitDropdown(provider.selectedFruit2, (val) {
                    provider.setFruit2(val);
                  }),
                  _fruitDropdown(provider.selectedFruit3, (val) {
                    provider.setFruit3(val);
                  }),
                ],
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Add Sugar",
                  style: AppWidgets.headlineTextStyle(20),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 180,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          "Sugar",
                          style: AppWidgets.headlineTextStyle(18),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (provider.sugarCount > 0) {
                                  provider.setSugarCount(
                                    provider.sugarCount - 1,
                                  );
                                }
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(width: 1.5),
                                color: Color(0xffecb47f),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Icon(Icons.remove, size: 30),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 80,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1.5),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                "${provider.sugarCount}",
                                style: AppWidgets.headlineTextStyle(18),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              provider.setSugarCount(provider.sugarCount + 1);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(width: 1.5),
                                color: Color(0xffecb47f),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Icon(Icons.add, size: 30),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Add Notes",
                  style: AppWidgets.headlineTextStyle(20),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  // width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    controller: notesController,
                    maxLines: 5,
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Column(
                      children: [
                        Text(
                          "Total Price : \$50",
                          style: AppWidgets.headlineTextStyle(20),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            // _paymentSuccess();
                            showPaymentOption(
                              context,
                              provider.selectedFruit1!,
                              provider.selectedFruit2!,
                              provider.selectedFruit3!,
                              provider.sugarCount,
                            );
                          },
                          child: Container(
                            width: 200,
                            decoration: BoxDecoration(
                              color: Color(0xffecb47f),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(width: 1.5),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                ),
                                child: Text(
                                  "Mix and Pay",
                                  style: AppWidgets.headlineTextStyle(20),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> showPaymentOption(
    BuildContext context,
    String fruit1,
    fruit2,
    fruit3,
    int sugarCount,
  ) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Choose One Option"),
          titleTextStyle: AppWidgets.headlineTextStyle(22),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  _paymentSuccess(fruit1, fruit2, fruit3, sugarCount);
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    "Pay With Cash",
                    style: AppWidgets.headlineTextStyle(14),
                  ),
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  if (int.parse(points!) >= 40) {
                    _paymentSuccessWithPoints(
                      fruit1,
                      fruit2,
                      fruit3,
                      sugarCount,
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      AppWidgets.customTostRedMessage(
                        "Not Enough Points Available",
                      ),
                    );
                  }
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    "Pay With Points",
                    style: AppWidgets.headlineTextStyle(14),
                  ),
                ),
              ),
            ],
          ),
          contentTextStyle: AppWidgets.headlineTextStyle(18),
        );
      },
    );
  }

  Widget _fruitDropdown(String? selectedFruit, Function(String?) onChanged) {
    return Consumer<JuicePageProvider>(
      builder: (ctx, provider, child) => Container(
        // width: 100,
        // height: 100,
        padding: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black45, width: 1.5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: selectedFruit,
            hint: Image.asset("images/tomato.png", height: 35, width: 35),
            icon: Icon(Icons.arrow_drop_down),
            items: provider.fruits.map((fruitPath) {
              return DropdownMenuItem(
                value: fruitPath,
                child: Image.asset(fruitPath, height: 35, width: 35),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
