import 'package:alumini_final/colors.dart';
import 'package:flutter/material.dart';

class Tab2 extends StatelessWidget {
  const Tab2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:BackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Color.fromRGBO(245, 245, 245, 1),
            ),
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Company Name",
                  style: TextStyle(
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.blueGrey,
                      fontSize: 13),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Google",
                  style: TextStyle(
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w600,
                      fontSize: 15),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Color.fromRGBO(245, 245, 245, 1),
            ),
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Company Location",
                  style: TextStyle(
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.blueGrey,
                      fontSize: 13),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "United States, California",
                  style: TextStyle(
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w600,
                      fontSize: 15),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Color.fromRGBO(245, 245, 245, 1),
            ),
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Designation",
                  style: TextStyle(
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.blueGrey,
                      fontSize: 13),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "App Developer",
                  style: TextStyle(
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w600,
                      fontSize: 15),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
