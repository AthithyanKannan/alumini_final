import 'dart:ui';
import 'package:alumini_final/auth/signin.dart';
import 'package:alumini_final/colors.dart';
import 'package:alumini_final/pages/profile/edit_myprofie.dart';
import 'package:alumini_final/pages/update_screens/update_profile.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabcontroller = TabController(length: 2, vsync: this);
    return Scaffold(
      backgroundColor: BackgroundColor,
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            text: 'My ', 
            style: TextStyle(
              fontSize: 20
            ),
            children: [
              TextSpan(
                text: 'Profile',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600
                )
                )
                ]),
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
        elevation: 0,
        leading: Icon(
          Icons.arrow_back_ios_new,
        ),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    useSafeArea: false,
                    context: context,
                    builder: (BuildContext context) {
                      return Expanded(
                          child: AlertDialog(
                        title: const Text('Log Out'),
                        content: const Text('Are you sure to Logout'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Back',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                              )),
                          TextButton(
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignIn(),
                                    ),
                                    (route) => false);
                              },
                              child: const Text(
                                'Exit',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                              ))
                        ],
                      ));
                    });
              },
              icon: const Icon(
                Icons.logout,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(clipBehavior: Clip.none, children: [
              Container(
                height: MediaQuery.of(context).size.height / 4,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12))),
                // child: Padding(
                //   padding:
                //       const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: const [
                //       Text(
                //         'My',
                //         style: TextStyle(fontSize: 25, color: Colors.white),
                //       ),
                //       Text(
                //         "Profile",
                //         style: TextStyle(
                //             fontWeight: FontWeight.bold,
                //             color: Colors.white,
                //             fontSize: 27),
                //       )
                //     ],
                //   ),
                // ),
              ),
              Positioned(
                top: 100,
                left: 30,
                right: 30,
                child: Container(
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: Colors.black87, blurRadius: 12)
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        'Athithyan K',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      const Text(
                        "BE Student",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TabBar(
                          controller: _tabcontroller,
                          isScrollable: true,
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.grey,
                          tabs: [
                            Tab(text: "Personal Info"),
                            Tab(
                              text: "Working Experience",
                            )
                          ])
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: 50,
                  left: 130,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.black,
                    backgroundImage: AssetImage(
                      "assets/Athi.jpg",
                    ),
                  ))
            ]),
            const SizedBox(
              height: 120,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width / 1.2,
              child: TabBarView(controller: _tabcontroller, children: [
                Container(
                    child: Tab(
                  child: Column(
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Batch',
                              style:
                                  TextStyle(fontFamily: 'Roboto', fontSize: 18),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '2025',
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 16,
                                      color: Colors.grey[600]),
                                )
                              ],
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'Branch',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Roboto',
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'ISE',
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 16,
                                      color: Colors.grey[600]),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Date of Birth',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Roboto',
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '13.04.2004',
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 16,
                                      color: Colors.grey[600]),
                                )
                              ],
                            ),
                          ])
                    ],
                  ),
                )),
                Container(
                    child: Tab(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'Designation',
                                style: TextStyle(
                                    fontFamily: 'Roboto', fontSize: 18),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'App Developer',
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 16,
                                        color: Colors.grey[600]),
                                  )
                                ],
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                'Industry Name',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'TCS',
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 16,
                                        color: Colors.grey[600]),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'Location',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Chennai',
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 16,
                                        color: Colors.grey[600]),
                                  )
                                ],
                              ),
                            ])
                      ]),
                ))
              ]),
            )
          ],
        ),
      ),
    );
  }
}

