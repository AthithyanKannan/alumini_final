import 'package:alumini_final/auth/get_users.dart';
import 'package:alumini_final/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../increment.dart';
import '../update_screens/update_profile.dart';

class AluminiProfile extends StatefulWidget {
  Map<String, dynamic> data1;

  AluminiProfile({
    Key? key,
    required this.data1,
  }) : super(key: key);

  @override
  State<AluminiProfile> createState() => _AluminiProfileState();
}

class _AluminiProfileState extends State<AluminiProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        elevation: 0.0,
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // if (industry == 1)
             ShowIndustryUserDetails(),
            // if (higherstudies == 1) ShowIndustryUserDetails(),
          ],
        ),
      ),
    );
  }

  Widget ShowIndustryUserDetails() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: primaryColor,
            boxShadow: const <BoxShadow>[
              BoxShadow(
                  color: Colors.black54,
                  blurRadius: 15.0,
                  offset: Offset(0.0, 0.75))
            ],
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
          ),
          padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0), //or 15.0
                            child: Container(
                              height: 90.0,
                              width: 90.0,
                              child: Image.asset('assets/Athi.jpg'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Text(widget.data1['name'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(widget.data1['designation'],
                              style: const TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                // letterSpacing: 1.0
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(widget.data1['location'],
                              style: const TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              )),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/logo_brand.png',
                    width: 50,
                    height: 50,
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black54,
                    blurRadius: 15.0,
                    offset: Offset(0.0, 0.75))
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Alumni Details",
                  style: TextStyle(
                      // letterSpacing: 1.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
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
                      const Text(
                        "Branch",
                        style: TextStyle(
                            // letterSpacing: 1.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.data1['branch'],
                        style: const TextStyle(
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
                    children: const [
                      Text(
                        "Contact",
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
                        'surya@gmail.com',
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
                      const Text(
                        "Batch",
                        style: TextStyle(
                            // letterSpacing: 1.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.data1['batch'],
                        style: const TextStyle(
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
                      const Text(
                        "Designation",
                        style: TextStyle(
                            // letterSpacing: 1.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.data1['designation'],
                        style: const TextStyle(
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
                      const Text(
                        "Working At",
                        style: TextStyle(
                            // letterSpacing: 1.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.data1['industryname'],
                        style: const TextStyle(
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
                      const Text(
                        "Location",
                        style: TextStyle(
                            // letterSpacing: 1.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.data1['location'],
                        style: const TextStyle(
                            // letterSpacing: 1.0,
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget ShowHigherUserUserDetails() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: primaryColor,
            boxShadow: const <BoxShadow>[
              BoxShadow(
                  color: Colors.black54,
                  blurRadius: 15.0,
                  offset: Offset(0.0, 0.75))
            ],
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
          ),
          padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0), //or 15.0
                            child: Container(
                              height: 90.0,
                              width: 90.0,
                              child: Image.asset('assets/Athi.jpg'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Text(widget.data1['name'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                // letterSpacing: 1.0
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(widget.data1['designation'],
                              style: const TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                // letterSpacing: 1.0
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(widget.data1['industryname'],
                              style: const TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              )),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/logo_brand.png',
                    width: 50,
                    height: 50,
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black54,
                    blurRadius: 15.0,
                    offset: Offset(0.0, 0.75))
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Alumni Details",
                  style: TextStyle(
                      // letterSpacing: 1.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
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
                      const Text(
                        "Branch",
                        style: TextStyle(
                            // letterSpacing: 1.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.data1['branch'],
                        style: const TextStyle(
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
                    children: const [
                      Text(
                        "Contact",
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
                        '',
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
                      const Text(
                        "Batch",
                        style: TextStyle(
                            // letterSpacing: 1.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.data1['batch'],
                        style: const TextStyle(
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
                      const Text(
                        "About Business",
                        style: TextStyle(
                            // letterSpacing: 1.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.data1['about business'],
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
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
                      const Text(
                        "Location",
                        style: TextStyle(
                            // letterSpacing: 1.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.data1['location'],
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget ShowEntrepruerUserDetails() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: primaryColor,
            boxShadow: const <BoxShadow>[
              BoxShadow(
                  color: Colors.black54,
                  blurRadius: 15.0,
                  offset: Offset(0.0, 0.75))
            ],
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
          ),
          padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0), //or 15.0
                            child: Container(
                              height: 90.0,
                              width: 90.0,
                              child: Image.asset('assets/Athi.jpg'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Text(widget.data1['name'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                // letterSpacing: 1.0
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(widget.data1['about business'],
                              style: const TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                // letterSpacing: 1.0
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(widget.data1['location'],
                              style: const TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              )),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/logo_brand.png',
                    width: 50,
                    height: 50,
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black54,
                    blurRadius: 15.0,
                    offset: Offset(0.0, 0.75))
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Alumni Details",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.black),
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
                      const Text(
                        "Branch",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.data1['branch'],
                        style: const TextStyle(
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
                    children: const [
                      Text(
                        "Contact",
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
                        '',
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
                      const Text(
                        "Batch",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.data1['batch'],
                        style: const TextStyle(
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
                      const Text(
                        "About Business",
                        style: TextStyle(
                            // letterSpacing: 1.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.data1['about business'],
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
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
                      const Text(
                        "Location",
                        style: TextStyle(
                            // letterSpacing: 1.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.data1['location'],
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget ShowExamUserDetails() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: primaryColor,
            boxShadow: const <BoxShadow>[
              BoxShadow(
                  color: Colors.black54,
                  blurRadius: 15.0,
                  offset: Offset(0.0, 0.75))
            ],
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
          ),
          padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0), //or 15.0
                            child: Container(
                              height: 90.0,
                              width: 90.0,
                              child: Image.asset('assets/Athi.jpg'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Text(widget.data1['name'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                // letterSpacing: 1.0
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(widget.data1['preparing for'],
                              style: const TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                // letterSpacing: 1.0
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(widget.data1['location'],
                              style: const TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              )),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/logo_brand.png',
                    width: 50,
                    height: 50,
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black54,
                    blurRadius: 15.0,
                    offset: Offset(0.0, 0.75))
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Alumni Details",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.black),
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
                      const Text(
                        "Branch",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.data1['branch'],
                        style: const TextStyle(
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
                    children: const [
                      Text(
                        "Contact",
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
                        '',
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
                      const Text(
                        "Batch",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.data1['batch'],
                        style: const TextStyle(
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
                      const Text(
                        "Preparing For",
                        style: TextStyle(
                            // letterSpacing: 1.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.data1['preparing for'],
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
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
                      const Text(
                        "Location",
                        style: TextStyle(
                            // letterSpacing: 1.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.data1['location'],
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget ShowTrainerUserDetails() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: primaryColor,
            boxShadow: const <BoxShadow>[
              BoxShadow(
                  color: Colors.black54,
                  blurRadius: 15.0,
                  offset: Offset(0.0, 0.75))
            ],
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
          ),
          padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0), //or 15.0
                            child: Container(
                              height: 90.0,
                              width: 90.0,
                              child: Image.asset('assets/Athi.jpg'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Text(widget.data1['name'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                // letterSpacing: 1.0
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(widget.data1['training role'],
                              style: const TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                // letterSpacing: 1.0
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(widget.data1['training location'],
                              style: const TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              )),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/logo_brand.png',
                    width: 50,
                    height: 50,
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black54,
                    blurRadius: 15.0,
                    offset: Offset(0.0, 0.75))
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Alumni Details",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.black),
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
                      const Text(
                        "Branch",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.data1['branch'],
                        style: const TextStyle(
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
                    children: const [
                      Text(
                        "Contact",
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
                        '',
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
                      const Text(
                        "Batch",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.data1['batch'],
                        style: const TextStyle(
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
                      const Text(
                        "Trainer at",
                        style: TextStyle(
                            // letterSpacing: 1.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.data1['institute/college'],
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
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
                      const Text(
                        "Role",
                        style: TextStyle(
                            // letterSpacing: 1.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.data1['training role'],
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
                      ),
                    ],
                  ),
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
                      const Text(
                        "Location",
                        style: TextStyle(
                            // letterSpacing: 1.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.data1['training location'],
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget ShowBankUserDetails() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: primaryColor,
            boxShadow: const <BoxShadow>[
              BoxShadow(
                  color: Colors.black54,
                  blurRadius: 15.0,
                  offset: Offset(0.0, 0.75))
            ],
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
          ),
          padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0), //or 15.0
                            child: Container(
                              height: 90.0,
                              width: 90.0,
                              child: Image.asset('assets/Athi.jpg'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Text(widget.data1['name'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                // letterSpacing: 1.0
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(widget.data1['bank name'],
                              style: const TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                // letterSpacing: 1.0
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(widget.data1['location'],
                              style: const TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              )),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/logo_brand.png',
                    width: 50,
                    height: 50,
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black54,
                    blurRadius: 15.0,
                    offset: Offset(0.0, 0.75))
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Alumni Details",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.black),
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
                      const Text(
                        "Branch",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.data1['branch'],
                        style: const TextStyle(
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
                    children: const [
                      Text(
                        "Contact",
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
                        '',
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
                      const Text(
                        "Batch",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.data1['batch'],
                        style: const TextStyle(
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
                      const Text(
                        "Working at",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.data1['bank name'],
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
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
                      const Text(
                        "Designation",
                        style: TextStyle(
                            // letterSpacing: 1.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.data1['designation'],
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
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
                      const Text(
                        "Location",
                        style: TextStyle(
                            // letterSpacing: 1.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.data1['location'],
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget ShowSearchUserDetails() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: primaryColor,
            boxShadow: const <BoxShadow>[
              BoxShadow(
                  color: Colors.black54,
                  blurRadius: 15.0,
                  offset: Offset(0.0, 0.75))
            ],
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
          ),
          padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0), //or 15.0
                            child: Container(
                              height: 90.0,
                              width: 90.0,
                              child: Image.asset('assets/Athi.jpg'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Text(widget.data1['name'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                // letterSpacing: 1.0
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(widget.data1['skills at'],
                              style: const TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                // letterSpacing: 1.0
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(widget.data1['location'],
                              style: const TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              )),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/logo_brand.png',
                    width: 50,
                    height: 50,
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black54,
                    blurRadius: 15.0,
                    offset: Offset(0.0, 0.75))
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Alumni Details",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.black),
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
                      const Text(
                        "Branch",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.data1['branch'],
                        style: const TextStyle(
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
                    children: const [
                      Text(
                        "Contact",
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
                        '',
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
                      const Text(
                        "Batch",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.data1['batch'],
                        style: const TextStyle(
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
                      const Text(
                        "Searching for",
                        style: TextStyle(
                            // letterSpacing: 1.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.data1['searching for'],
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
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
                      const Text(
                        "Skills at",
                        style: TextStyle(
                            // letterSpacing: 1.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.data1['skills at'],
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
                      ),
                    ],
                  ),
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
                      const Text(
                        "Location",
                        style: TextStyle(
                            // letterSpacing: 1.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.data1['location'],
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget ShowGovtUserDetails() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: primaryColor,
            boxShadow: const <BoxShadow>[
              BoxShadow(
                  color: Colors.black54,
                  blurRadius: 15.0,
                  offset: Offset(0.0, 0.75))
            ],
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
          ),
          padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0), //or 15.0
                            child: Container(
                              height: 90.0,
                              width: 90.0,
                              child: Image.asset('assets/Athi.jpg'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Text(widget.data1['name'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                // letterSpacing: 1.0
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(widget.data1['designation'],
                              style: const TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                // letterSpacing: 1.0
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(widget.data1['location'],
                              style: const TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              )),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/logo_brand.png',
                    width: 50,
                    height: 50,
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black54,
                    blurRadius: 15.0,
                    offset: Offset(0.0, 0.75))
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Alumni Details",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.black),
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
                      const Text(
                        "Branch",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.data1['branch'],
                        style: const TextStyle(
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
                    children: const [
                      Text(
                        "Contact",
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
                        '',
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
                      const Text(
                        "Batch",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.data1['batch'],
                        style: const TextStyle(
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
                      const Text(
                        "Designation",
                        style: TextStyle(
                            // letterSpacing: 1.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.data1['designation'],
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
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
                      const Text(
                        "Location",
                        style: TextStyle(
                            // letterSpacing: 1.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.data1['location'],
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget ShowOtherUserDetails() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: primaryColor,
            boxShadow: const <BoxShadow>[
              BoxShadow(
                  color: Colors.black54,
                  blurRadius: 15.0,
                  offset: Offset(0.0, 0.75))
            ],
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
          ),
          padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0), //or 15.0
                            child: Container(
                              height: 90.0,
                              width: 90.0,
                              child: Image.asset('assets/Athi.jpg'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Text(widget.data1['name'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                // letterSpacing: 1.0
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(widget.data1['other'],
                              style: const TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              )),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/logo_brand.png',
                    width: 50,
                    height: 50,
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black54,
                    blurRadius: 15.0,
                    offset: Offset(0.0, 0.75))
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Alumni Details",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.black),
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
                      const Text(
                        "Branch",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.data1['branch'],
                        style: const TextStyle(
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
                    children: const [
                      Text(
                        "Contact",
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
                        '',
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
                      const Text(
                        "Batch",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.data1['batch'],
                        style: const TextStyle(
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
                      const Text(
                        "Other",
                        style: TextStyle(
                            // letterSpacing: 1.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.data1['other'],
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
