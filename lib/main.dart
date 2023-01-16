import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:petstore/widgets/first_image_item.dart';
import 'package:petstore/widgets/product_item.dart';
import 'package:petstore/widgets/second_image_item.dart';

import 'app_data/app_data.dart';
import 'model/product.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _showFirstImage = true;
  int _selectedButtonIndex = 1;
  String _selectedText = "All";
////////////////////////////////// Ui Methodes
  Padding buildTitleRow(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(
              color: Colors.orange,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  ElevatedButton createElevatedButton(
      {int? index, required String text, required bool b}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: _selectedButtonIndex == index
            ? Color.fromARGB(255, 255, 148, 68)
            : Color.fromARGB(255, 248, 248, 248),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      onPressed: () {
        setState(() {
          _selectedButtonIndex = index!;
          _showFirstImage = b;
        });
      },
      child: SizedBox(
        height: 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              text,
              style: TextStyle(
                color: _selectedButtonIndex == index
                    ? Color.fromARGB(255, 248, 248, 248)
                    : Color.fromARGB(255, 180, 178, 177),
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded buildIcon(IconData icon, Color color) {
    return Expanded(
      flex: 1,
      child: Icon(
        icon,
        color: color,
        size: 35,
      ),
    );
  }

////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQueryData(),
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 252, 252),
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: InkWell(
                        onTap: () {
                          // Handle search functionality
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            // ignore: prefer_const_literals_to_create_immutables
                            boxShadow: [
                              const BoxShadow(
                                color: Colors.black12,
                                offset: Offset(2.0, 2.0),
                                blurRadius: 5.0,
                                spreadRadius: 1.0,
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child:
                              Icon(Icons.search, color: Colors.black, size: 30),
                        ),
                      ),
                    ),
                    const Expanded(
                      flex: 6,
                      child: Center(
                        child: Text(
                          "Canino-food",
                          style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: InkWell(
                        onTap: () {
                          // Handle notification functionality
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                offset: Offset(2.0, 2.0),
                                blurRadius: 5.0,
                                spreadRadius: 1.0,
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(Icons.notifications,
                              color: Colors.black, size: 30),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              _selectedButtonIndex == 1
                  ? FirstImageItem()
                  : _selectedButtonIndex == 5
                      ? SeconImageItem()
                      : Text(''),
              buildTitleRow("Category", "View All"),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      createElevatedButton(index: 1, text: "All", b: true),
                      SizedBox(width: 10),
                      createElevatedButton(index: 2, text: "Food", b: true),
                      SizedBox(width: 10),
                      createElevatedButton(index: 3, text: "Toys", b: true),
                      SizedBox(width: 10),
                      createElevatedButton(
                          index: 4, text: "Accessories", b: true),
                      SizedBox(width: 10),
                      createElevatedButton(
                          index: 5, text: "Pharmacy", b: false),
                    ],
                  ),
                ),
              ),

              buildTitleRow("Best Seller", "View All"),
              Expanded(
                flex: 4,
                child: SizedBox(
                  height: 10,
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1,
                    children: _selectedButtonIndex == 1
                        ? Product_data.map((product) {
                            return ProductItem(product);
                          }).toList()
                        : _selectedButtonIndex == 5
                            ? Product_data.where(
                                    (product) => product.type == "ph")
                                .map((product) {
                                return ProductItem(product);
                              }).toList()
                            : [],
                  ),
                ),
              ),

              Expanded(
                child: AnimatedOpacity(
                  opacity:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? 1
                          : 0,
                  duration: Duration(milliseconds: 300),
                  child: Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40)),
                          color: Color.fromARGB(255, 248, 248, 248),
                          boxShadow: [
                            BoxShadow(offset: Offset(0, 5), blurRadius: 10)
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          buildIcon(Icons.home, Colors.orange),
                          buildIcon(Icons.access_time,
                              Color.fromARGB(255, 180, 178, 177)),
                          buildIcon(Icons.shopping_bag,
                              Color.fromARGB(255, 180, 178, 177)),
                          buildIcon(
                              Icons.person, Color.fromARGB(255, 180, 178, 177)),
                        ],
                      ),
                    ),
                  ),
                ),
              )

              //ProductItem(),
              //SeconImageItem(),
            ],
          ),
        ),
      ),
    );
  }
}
