import 'package:alumini_final/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Tab2 extends StatefulWidget {
  final QueryDocumentSnapshot TabBar2Data;
  Tab2({Key? key, required this.TabBar2Data}) : super(key: key);

  @override
  State<Tab2> createState() => _Tab2State();
}

class _Tab2State extends State<Tab2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(children: [
          if (widget.TabBar2Data['1'] == "1")
            CurrentUserTabView2(
                "Industry Name",
                "${widget.TabBar2Data['industryname']}",
                "Designation",
                "${widget.TabBar2Data['designation']}",
                "Location",
                "${widget.TabBar2Data['location']}"),
          if (widget.TabBar2Data['2'] == '2')
            CurrentUserTabView2(
                "Degree",
                "${widget.TabBar2Data['degree']}",
                "Currently at",
                "${widget.TabBar2Data['higheducation']}",
                "Location",
                "${widget.TabBar2Data['higheducationlocation']}"),
        ]),
      ),
    );
  }

  Widget CurrentUserTabView2(String text1, String text2, String text3,
      String text4, String text5, String text6) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Color.fromRGBO(245, 245, 245, 1),
          ),
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text1,
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
                text2,
                style: TextStyle(
                    // letterSpacing: 1.0,
                    fontWeight: FontWeight.w600,
                    fontSize: 15),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Color.fromRGBO(245, 245, 245, 1),
          ),
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text3,
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
                text4,
                style: TextStyle(
                    // letterSpacing: 1.0,
                    fontWeight: FontWeight.w600,
                    fontSize: 15),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Color.fromRGBO(245, 245, 245, 1),
          ),
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text5,
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
                text6,
                style: TextStyle(
                    // letterSpacing: 1.0,
                    fontWeight: FontWeight.w600,
                    fontSize: 15),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
