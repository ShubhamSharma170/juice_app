// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:juice_delivery_app/services/firebase_method.dart';
import 'package:juice_delivery_app/services/shared_preference.dart';
import 'package:juice_delivery_app/services/support_widget.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  Stream? orderStream;
  String? id;

  allOrder() async {
    id = await SharedPreferenceClass.getUserId();
    orderStream = await FirebaseMethod.orderSnapshot(id!);
    setState(() {});
  }

  @override
  initState() {
    allOrder();
    super.initState();
  }

  Widget oderData() {
    return StreamBuilder(
      stream: orderStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ?  ListView.builder(
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
                        padding: EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(color: Colors.white),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              ds['type'] == "Orange"
                                  ? "images/orange-juice.png"
                                  : "images/grape-juice.png",
                              height: 80,
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ds['UserName'],
                                  // "Shubham",
                                  style: AppWidgets.headlineTextStyle(18),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[400],
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Image.asset(
                                        // "images/pineapple.png",
                                        ds['SelectedFruit1'],
                                        height: 25,
                                        width: 25,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[400],
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Image.asset(
                                        // "images/pineapple.png",
                                        ds['SelectedFruit2'],
                                        height: 25,
                                        width: 25,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[400],
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Image.asset(
                                        // "images/pineapple.png",
                                        ds['SelectedFruit3'],
                                        height: 25,
                                        width: 25,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Sugar : ${ds['SugarCount']}",
                                  style: AppWidgets.headlineTextStyle(15),
                                ),
                                ds['Delivered'] == "false"
                                    ? Text(
                                        "Yet to be delivered!",
                                        style: AppWidgets.headlineTextStyle(
                                          15,
                                          colors: Colors.red,
                                        ),
                                      )
                                    : Text(
                                        "Delivered Complete",
                                        style: AppWidgets.headlineTextStyle(
                                          15,
                                          colors: Colors.green,
                                        ),
                                      ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            : Center(
                child: Text(
                  "No Order Available",
                  style: AppWidgets.headlineTextStyle(25),
                ),
              );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  "ORDER PAGE",
                  style: AppWidgets.headlineTextStyle(30),
                ),
              ),
              SizedBox(height: 40),
              Stack(
                children: [
                  Image.asset(
                    "images/water.png",
                    fit: BoxFit.fill,
                    height: MediaQuery.of(context).size.height / 1.3,
                  ),
                  oderData(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
