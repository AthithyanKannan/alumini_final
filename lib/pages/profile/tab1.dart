import 'package:alumini_final/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'profilepage.dart';

class Tab1 extends StatefulWidget {
  Tab1({Key? key}) : super(key: key);

  @override
  State<Tab1> createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColor,
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
                  "Branch",
                  style: TextStyle(
                      // letterSpacing: 1.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.blueGrey,
                      fontSize: 13),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "ISE",
                  style: TextStyle(
                      // letterSpacing: 1.0,
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
                  "Batch",
                  style: TextStyle(
                      // letterSpacing: 1.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.blueGrey,
                      fontSize: 13),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "2025",
                  style: TextStyle(
                      // letterSpacing: 1.0,
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
                  "Date of Birth",
                  style: TextStyle(
                      // letterSpacing: 1.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.blueGrey,
                      fontSize: 13),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "13/04/2004",
                  style: TextStyle(
                      // letterSpacing: 1.0,
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
                  "Blood Group",
                  style: TextStyle(
                      // letterSpacing: 1.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.blueGrey,
                      fontSize: 13),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "B+",
                  style: TextStyle(
                      // letterSpacing: 1.0,
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
