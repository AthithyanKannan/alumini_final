import 'package:alumini_final/auth/login_screen.dart';
import 'package:alumini_final/colors.dart';
import 'package:alumini_final/pages/profile/edit_myprofie.dart';
import 'package:alumini_final/pages/profile/tab1.dart';
import 'package:alumini_final/pages/profile/tab2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: primaryColor,
        elevation: 0,
        title: RichText(
          text: const TextSpan(
              text: 'My ',
              style: TextStyle(fontSize: 20),
              children: [
                TextSpan(
                    text: 'Profile',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600))
              ]),
        ),
        actions: [
          // IconButton(
          //     onPressed: () {
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) => editprofile(),
          //           ));
          //     },
          //     icon: Icon(Icons.edit)),
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
                                      builder: (context) => const LoginScreen(),
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
      body: FutureBuilder(
        future: fetchUserFields(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final QueryDocumentSnapshot tabbarData =
                snapshot.data! as QueryDocumentSnapshot;
            String name = snapshot.data!['name'];
            String batch = snapshot.data!['batch'];
            String branch = snapshot.data!['branch'];
            String dob = snapshot.data!['dob'];

            // EditPersonalTab(
            //   name: name,
            //   batch: batch,
            //   branch: branch,
            //   dob: dob,
            // );

            if ('${snapshot.data!['number']}' == '1') {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    ProfileUser(
                        snapshot.data!['name'],
                        snapshot.data!['designation'],
                        snapshot.data!['location']),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => editprofile(
                                      name1: name,
                                      batch1: batch,
                                      branch1: branch,
                                      dob1: dob,
                                    ),
                                  ));
                            },
                            style: ElevatedButton.styleFrom(
                                onPrimary: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                backgroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10)),
                            child: Text(
                              "Edit Profile",
                              style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w600),
                            )),
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 1.8,
                        child: Column(
                          children: [
                            const SizedBox(height: 25),
                            Container(
                              width: MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: TabBar(
                                      indicatorColor: primaryColor,
                                      controller: tabController,
                                      indicatorPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 1),
                                      indicatorWeight: 1,
                                      indicator: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      labelColor: Colors.white,
                                      unselectedLabelColor: Colors.black,
                                      tabs: const [
                                        Tab(
                                          text: 'Personal Info',
                                        ),
                                        Tab(
                                          text: 'Working Experience',
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: tabController,
                                children: [
                                  Tab1(TabBar1Data: tabbarData),
                                  Tab2(
                                    TabBar2Data: tabbarData,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else if ('${snapshot.data!['number']}' == '2') {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    ProfileUser(
                        snapshot.data!['name'],
                        snapshot.data!['degree'],
                        snapshot.data!['higheducationlocation']),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 1.8,
                        child: Column(
                          children: [
                            const SizedBox(height: 25),
                            Container(
                              width: MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: TabBar(
                                      indicatorColor: primaryColor,
                                      controller: tabController,
                                      indicatorPadding:
                                          const EdgeInsets.symmetric(horizontal: 1),
                                      indicatorWeight: 1,
                                      indicator: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(5)),
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
                                ],
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: tabController,
                                children: [
                                  Tab1(TabBar1Data: tabbarData),
                                  Tab2(
                                    TabBar2Data: tabbarData,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else if ('${snapshot.data!['number']}' == "3") {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    ProfileUser(
                        snapshot.data!['name'],
                        snapshot.data!['about business'],
                        snapshot.data!['location']),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 1.8,
                        child: Column(
                          children: [
                            SizedBox(height: 25),
                            Container(
                              width: MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: TabBar(
                                      indicatorColor: primaryColor,
                                      controller: tabController,
                                      indicatorPadding:
                                          EdgeInsets.symmetric(horizontal: 1),
                                      indicatorWeight: 1,
                                      indicator: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(5)),
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
                                ],
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: tabController,
                                children: [
                                  Tab1(TabBar1Data: tabbarData),
                                  Tab2(
                                    TabBar2Data: tabbarData,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else if ('${snapshot.data!['number']}' == "4") {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    ProfileUser(snapshot.data!['name'], snapshot.data!['batch'],
                        snapshot.data!['location']),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 1.8,
                        child: Column(
                          children: [
                            SizedBox(height: 25),
                            Container(
                              width: MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: TabBar(
                                      indicatorColor: primaryColor,
                                      controller: tabController,
                                      indicatorPadding:
                                          EdgeInsets.symmetric(horizontal: 1),
                                      indicatorWeight: 1,
                                      indicator: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(5)),
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
                                ],
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: tabController,
                                children: [
                                  Tab1(TabBar1Data: tabbarData),
                                  Tab2(
                                    TabBar2Data: tabbarData,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else if ('${snapshot.data!['number']}' == "5") {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    ProfileUser(
                        snapshot.data!['name'],
                        snapshot.data!['training role'],
                        snapshot.data!['training location']),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 1.8,
                        child: Column(
                          children: [
                            SizedBox(height: 25),
                            Container(
                              width: MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: TabBar(
                                      indicatorColor: primaryColor,
                                      controller: tabController,
                                      indicatorPadding:
                                          EdgeInsets.symmetric(horizontal: 1),
                                      indicatorWeight: 1,
                                      indicator: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(5)),
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
                                ],
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: tabController,
                                children: [
                                  Tab1(TabBar1Data: tabbarData),
                                  Tab2(TabBar2Data: tabbarData),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else if ('${snapshot.data!['number']}' == "6") {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    ProfileUser(
                        snapshot.data!['name'],
                        snapshot.data!['designation'],
                        snapshot.data!['location']),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 1.8,
                        child: Column(
                          children: [
                            SizedBox(height: 25),
                            Container(
                              width: MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: TabBar(
                                      indicatorColor: primaryColor,
                                      controller: tabController,
                                      indicatorPadding:
                                          EdgeInsets.symmetric(horizontal: 1),
                                      indicatorWeight: 1,
                                      indicator: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(5)),
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
                                ],
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: tabController,
                                children: [
                                  Tab1(TabBar1Data: tabbarData),
                                  Tab2(
                                    TabBar2Data: tabbarData,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else if ('${snapshot.data!['number']}' == "7") {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    ProfileUser(snapshot.data!['name'],
                        snapshot.data!['branch'], snapshot.data!['location']),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 1.8,
                        child: Column(
                          children: [
                            SizedBox(height: 25),
                            Container(
                              width: MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: TabBar(
                                      indicatorColor: primaryColor,
                                      controller: tabController,
                                      indicatorPadding:
                                          EdgeInsets.symmetric(horizontal: 1),
                                      indicatorWeight: 1,
                                      indicator: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(5)),
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
                                ],
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: tabController,
                                children: [
                                  Tab1(TabBar1Data: tabbarData),
                                  Tab2(
                                    TabBar2Data: tabbarData,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else if ('${snapshot.data!['number']}' == "8") {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    ProfileUser(snapshot.data!['name'],
                        snapshot.data!['branch'], snapshot.data!['location']),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 1.8,
                        child: Column(
                          children: [
                            SizedBox(height: 25),
                            Container(
                              width: MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: TabBar(
                                      indicatorColor: primaryColor,
                                      controller: tabController,
                                      indicatorPadding:
                                          EdgeInsets.symmetric(horizontal: 1),
                                      indicatorWeight: 1,
                                      indicator: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(5)),
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
                                ],
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: tabController,
                                children: [
                                  Tab1(TabBar1Data: tabbarData),
                                  Tab2(
                                    TabBar2Data: tabbarData,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else if ('${snapshot.data!['number']}' == "9") {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    ProfileUser(snapshot.data!['name'], snapshot.data!['batch'],
                        snapshot.data!['other']),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 1.8,
                        child: Column(
                          children: [
                            SizedBox(height: 25),
                            Container(
                              width: MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: TabBar(
                                      indicatorColor: primaryColor,
                                      controller: tabController,
                                      indicatorPadding:
                                          EdgeInsets.symmetric(horizontal: 1),
                                      indicatorWeight: 1,
                                      indicator: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(5)),
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
                                ],
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: tabController,
                                children: [
                                  Tab1(TabBar1Data: tabbarData),
                                  Tab2(
                                    TabBar2Data: tabbarData,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            }
          }
          return Text("Loading");
        },
      ),
    );
  }

  Future<DocumentSnapshot?> fetchUserFields() async {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    final User? user = _firebaseAuth.currentUser;

    if (user != null) {
      final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
      QuerySnapshot currentuserSnapshot = await _firebaseFirestore
          .collection('users')
          .where('email', isEqualTo: user.email)
          .get();
      if (currentuserSnapshot.docs.isNotEmpty) {
        return currentuserSnapshot.docs.first;
      } else {
        return null;
      }
    }
  }

  Widget ProfileUser(
      String name, String accordingtouser, String accordingtouser1) {
    return Container(
      decoration: BoxDecoration(
        color: primaryColor,
        boxShadow: const <BoxShadow>[
          BoxShadow(
              color: Colors.black54,
              blurRadius: 15.0,
              offset: Offset(0.0, 0.75))
        ],
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
      ),
      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
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
                        child: SizedBox(
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
                      SizedBox(
                        height: 5,
                      ),
                      Text(name,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            // letterSpacing: 1.0
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(accordingtouser,
                          style: const TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            // letterSpacing: 1.0
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(accordingtouser1,
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
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     ElevatedButton(
          //         onPressed: () {
          //           Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                 builder: (context) => editprofile(),
          //               ));
          //         },
          //         style: ElevatedButton.styleFrom(
          //             onPrimary: Colors.white,
          //             shape: RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.circular(10)),
          //             backgroundColor: Colors.white,
          //             padding: const EdgeInsets.symmetric(
          //                 horizontal: 20, vertical: 10)),
          //         child: Text(
          //           "Edit Profile",
          //           style: TextStyle(
          //               color: primaryColor,
          //               // letterSpacing: 1.0,
          //               fontWeight: FontWeight.w600),
          //         )),
          //   ],
          // ),
        ],
      ),
    );
  }
}
