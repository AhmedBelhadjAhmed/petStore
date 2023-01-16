import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SeconImageItem extends StatefulWidget {
  const SeconImageItem({super.key});

  @override
  State<SeconImageItem> createState() => _SeconImageItemState();
}

class _SeconImageItemState extends State<SeconImageItem> {
  @override
  //////UI Methodes
  Padding circles({double? ptop, double? pleft}) {
    return Padding(
      padding: EdgeInsets.only(left: pleft!, top: ptop!),
      child: Container(
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromARGB(255, 252, 70, 118),
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
          image: AssetImage("assets/2.png"),
        ),
      ),
    );
  }

  Widget text(
      String text, double top, double left, bool textBold, double fontSize) {
    return Padding(
      padding: EdgeInsets.only(top: top, left: left),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: textBold ? FontWeight.bold : FontWeight.normal,
          color: Colors.white,
          fontSize: fontSize,
        ),
      ),
    );
  }

  ////////////////////////////////
  Widget build(BuildContext context) {
    return SizedBox(
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
                color: Color.fromARGB(255, 238, 1, 60),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          circles(ptop: 60, pleft: 160),
          circles(ptop: 20, pleft: 30),
          imageProduct(left: 210.0, top: 10.0, height: 140),
          // ignore: prefer_const_literals_to_create_immutables
          text("Happy Dog", 40, 20, true, 20),
          text("Sensible-Adult", 70, 20, true, 20),
          text("Get an intersting promo ", 100, 20, false, 14),
          text("here, whitout conditions", 120, 20, false, 14),
        ],
      ),
    );
  }
}
