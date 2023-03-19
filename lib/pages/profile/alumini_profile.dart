import 'package:alumini_final/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AluminiProfile extends StatefulWidget {
  const AluminiProfile({super.key});

  @override
  State<AluminiProfile> createState() => _AluminiProfileState();
}

class _AluminiProfileState extends State<AluminiProfile> {
  @override
  Widget build(BuildContext context) {

   

    return Scaffold(
      backgroundColor: BackgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        title: Text(
          "Profile",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18,

            // letterSpacing: 2.0
          ),
        ),
        elevation: 0.0,
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: primaryColor,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black54,
                      blurRadius: 15.0,
                      offset: Offset(0.0, 0.75))
                ],
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
              ),
              padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
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
                                borderRadius:
                                    BorderRadius.circular(20.0), //or 15.0
                                child: Container(
                                  height: 90.0,
                                  width: 90.0,
                                  child: Image.asset('assets/Athi.jpg'),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              Text("Athithyan K",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    // letterSpacing: 1.0
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Software Developer,",
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    // letterSpacing: 1.0
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Google",
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    // letterSpacing: 1.0
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
                decoration: BoxDecoration(
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
                  const  Text(
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
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                            Text(
                            "Branch",
                            style:  TextStyle(
                                // letterSpacing: 1.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.blueGrey,
                                fontSize: 13),
                          ),
                           SizedBox(
                            height: 8,
                          ),
                           Text(
                            "Information Science and Engineering",
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
                            'athi',
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
                            "2025 ",
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
                            "Company Name",
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
                            "Google",
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
                            "Company Location",
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
                            "Unites States, California",
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
                            "Designation",
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
                            "Software Developer",
                            style: TextStyle(
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
        ),
      ),
    );
  }
}
