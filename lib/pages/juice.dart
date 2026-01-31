import 'package:flutter/material.dart';
import 'package:juice_delivery_app/services/support_widget.dart';

class JuicePage extends StatefulWidget {
  const JuicePage({super.key});

  @override
  State<JuicePage> createState() => _JuicePageState();
}

class _JuicePageState extends State<JuicePage> {
  final List<String> fruits = [
    "images/tomato.png",
    "images/watermelon.png",
    "images/pineapple.png",
    "images/banana.png",
    "images/apple.png",
  ];

  String? selectedFruit1;
  String? selectedFruit2;
  String? selectedFruit3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Column(
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
                _fruitDropdown(selectedFruit1, (val) {
                  setState(() {
                    selectedFruit1 = val;
                  });
                }),
                _fruitDropdown(selectedFruit2, (val) {
                  setState(() {
                    selectedFruit2 = val;
                  });
                }),
                _fruitDropdown(selectedFruit3, (val) {
                  setState(() {
                    selectedFruit3 = val;
                  });
                }),
              ],
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text("Add Sugar", style: AppWidgets.headlineTextStyle(20)),
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
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 1.5),
                            color: Color(0xffecb47f),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(Icons.remove, size: 30),
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
                              "1",
                              style: AppWidgets.headlineTextStyle(18),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 1.5),
                            color: Color(0xffecb47f),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(Icons.add, size: 30),
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
              child: Text("Add Notes", style: AppWidgets.headlineTextStyle(20)),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                // width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
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
                      Container(
                        width: 200,
                        decoration: BoxDecoration(
                          color: Color(0xffecb47f),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(width: 1.5),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              "Mix and Pay",
                              style: AppWidgets.headlineTextStyle(20),
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
    );
  }

  Widget _fruitDropdown(String? selectedFruit, Function(String?) onChanged) {
    return Container(
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
          items: fruits.map((fruitPath) {
            return DropdownMenuItem(
              value: fruitPath,
              child: Image.asset(fruitPath, height: 35, width: 35),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
