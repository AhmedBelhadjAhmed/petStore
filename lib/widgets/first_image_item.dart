import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FirstImageItem extends StatefulWidget {
  const FirstImageItem({super.key});

  @override
  State<FirstImageItem> createState() => _FirstImageItemState();
}

/////// UI Methodes
class _FirstImageItemState extends State<FirstImageItem> {
  Padding circles({double? ptop, double? pleft}) {
    return Padding(
      padding: EdgeInsets.only(left: pleft!, top: ptop!),
      child: Container(
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromARGB(255, 255, 164, 84),
        ),
      ),
    );
  }

  Padding textDescription(
      {double? pleft,
      double? ptop,
      String? text,
      bool bold = true,
      double? fontSize}) {
    return Padding(
      padding: EdgeInsets.only(left: pleft!, top: ptop!),
      child: Text(
        text!,
        style: TextStyle(
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
          color: Colors.white,
          fontSize: fontSize!,
        ),
      ),
    );
  }

  Padding imageProduct({double? height, double? left, double? top}) {
    return Padding(
      padding: EdgeInsets.only(left: left!, top: top!),
      child: Container(
        height: height,
        child: Image(
          image: AssetImage("assets/1.png"),
        ),
      ),
    );
  }

/////////////////////////////
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 180,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
                right: 20.0,
              ),
              child: Container(
                height: 160,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 148, 68),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            circles(ptop: 20, pleft: 250),
            circles(ptop: 60, pleft: 140),
            circles(ptop: 60, pleft: 10),
            imageProduct(height: 150, left: 30, top: 0),
            imageProduct(height: 130, left: 50, top: 50),
            textDescription(
                pleft: 150,
                ptop: 40,
                text: "Royal Canin Adult Pomeranian",
                fontSize: 20),
            textDescription(
                pleft: 150,
                ptop: 100,
                text: "Get an intersting promo here, whitout conditions",
                bold: false,
                fontSize: 15)
          ],
        ),
      ),
    );
  }
}
