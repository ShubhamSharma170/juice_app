import 'package:flutter/material.dart';
import 'package:juice_delivery_app/routes/route_name.dart';
import 'package:juice_delivery_app/services/support_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Find Out Best Juice",
                    style: AppWidgets.headlineTextStyle(25),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Image.asset("images/banner.png"),
                ),
                Stack(
                  children: [
                    Image.asset(
                      "images/water.png",
                      height: MediaQuery.of(context).size.height / 1.47,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 80, left: 15),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 2,
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 25,
                                ),
                                child: Image.asset(
                                  "images/orange-juice.png",
                                  height: 100,
                                  width: 100,
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Orange Juice",
                                          style: AppWidgets.headlineTextStyle(
                                            20,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Container(
                                          // padding: EdgeInsets.all(2),
                                          height: 20,
                                          width: 70,
                                          decoration: BoxDecoration(
                                            color: Color(0xffbcd786),
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "60 kcal",
                                              style:
                                                  AppWidgets.headlineTextStyle(
                                                    15,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "Enjoy the freshness when \nstarting your morning activities. ",
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: "Poppins",
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          RouteName.juicePage,
                                          arguments: "Orange"
                                        );
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(5),
                                        width:
                                            MediaQuery.of(context).size.width /
                                            2,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          color: Color(0xfffebd7f),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Add",
                                            style: AppWidgets.headlineTextStyle(
                                              15,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 2,
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 25,
                                ),
                                child: Image.asset(
                                  "images/grape-juice.png",
                                  height: 100,
                                  width: 100,
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Grape Juice",
                                          style: AppWidgets.headlineTextStyle(
                                            20,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Container(
                                          // padding: EdgeInsets.all(2),
                                          height: 20,
                                          width: 70,
                                          decoration: BoxDecoration(
                                            color: Color(0xffbcd786),
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "80 kcal",
                                              style:
                                                  AppWidgets.headlineTextStyle(
                                                    15,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "Grape juice contains antioxidants \nthat are good for health. ",
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: "Poppins",
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          RouteName.juicePage,
                                          arguments: "Grape"
                                        );
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(5),
                                        width:
                                            MediaQuery.of(context).size.width /
                                            2,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          color: Color(0xfffebd7f),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Add",
                                            style: AppWidgets.headlineTextStyle(
                                              15,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
