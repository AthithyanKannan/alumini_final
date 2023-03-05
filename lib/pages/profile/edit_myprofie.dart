import 'dart:ffi';
import 'dart:math';

import 'package:alumini_final/colors.dart';
import 'package:flutter/material.dart';

class editprofile extends StatefulWidget {
  const editprofile({super.key});

  @override
  State<editprofile> createState() => _editprofileState();
}

class _editprofileState extends State<editprofile>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _edittabcontroller = TabController(length: 2, vsync: this);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: RichText(
            text: TextSpan(
                text: 'Edit ',
                style: TextStyle(fontSize: 20),
                children: [
                  TextSpan(
                      text: 'Profile',
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600))
                ]),
          ),
          centerTitle: true,
          backgroundColor: primaryColor,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new),
          ),
        ),
        body: Flexible(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: (Radius.circular(30)),
                      bottomRight: (Radius.circular(30))),
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: Colors.white,
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0),
                      child: Container(
                          width: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(children: [
                            TabBar(
                                controller: _edittabcontroller,
                                indicatorPadding:
                                    EdgeInsets.symmetric(horizontal: 1),
                                indicatorWeight: 2,
                                indicator: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                labelColor: Colors.black,
                                unselectedLabelColor: Colors.white,
                                tabs: [
                                  Tab(
                                    text: 'Personal Info',
                                  ),
                                  Tab(
                                    text: 'Working Experience',
                                  )
                                ]),
                            TabBarView(
                                controller: _edittabcontroller,
                                children: [
                                  Tab(
                                    text: 'Athi',
                                  ),
                                  Tab(
                                    text: 'Thiru',
                                  )
                                ])
                          ])),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
