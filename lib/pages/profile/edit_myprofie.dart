import 'dart:ffi';
import 'dart:math';

import 'package:alumini_final/colors.dart';
import 'package:alumini_final/pages/profile/editpersonaltab.dart';
import 'package:alumini_final/pages/profile/editworktab.dart';
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
              backgroundColor: primaryColor,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                iconSize: 20,
                icon: Icon(Icons.arrow_back_ios_new),
              ),
            ),
            body: SingleChildScrollView(
                child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 1.5,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(children: [
                  SizedBox(height: 15),
                  Container(
                    width: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: TabBar(
                        indicatorColor: primaryColor,
                        controller: _edittabcontroller,
                        indicatorPadding: EdgeInsets.symmetric(horizontal: 1),
                        indicatorWeight: 1,
                        indicator: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(5)),
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.black,
                        tabs: [
                          Tab(
                            text: 'Personal Info',
                          ),
                          Tab(
                            text: 'Working Experience',
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: TabBarView(
                    controller: _edittabcontroller,
                    children: [EditPersonalTab(), EditWorkTab()],
                  )),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Save Changes'),
                      style: ButtonStyle(
                          textStyle: MaterialStateProperty.all(
                              const TextStyle(fontSize: 15)),
                          backgroundColor:
                              MaterialStateProperty.all(primaryColor),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                  horizontal: 80, vertical: 15)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)))))
                ]),
              ),
            ))));
  }
}
