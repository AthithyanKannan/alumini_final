import 'package:alumini_final/pages/profile/edit_myprofie.dart';
import 'package:alumini_final/pages/profile/tab1.dart';
import 'package:alumini_final/pages/profile/tab2.dart';
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "My Profile",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 18,
              letterSpacing: 2.0),
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
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
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Text("Athithiyan K",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  letterSpacing: 1.0)),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Software Developer,",
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  letterSpacing: 1.0)),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Google",
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  letterSpacing: 1.0)),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(onPressed: (()=>{}), child: Text(
                        "Edit Profile",
                        style: TextStyle(
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.w600
                        ),
                      )),
                      // Container(
                      //   decoration: BoxDecoration(
                      //       gradient: LinearGradient(
                      //         begin: Alignment.bottomLeft,
                      //         end: Alignment.topRight,
                      //         colors: [
                      //           Color.fromRGBO(46, 170, 250, 1),
                      //           Color.fromRGBO(31, 47, 152, 1),
                      //         ],
                      //       ),
                      //       borderRadius: BorderRadius.circular(5)),
                      //   padding: EdgeInsets.all(8),
                      //   child: Text(
                      //     "Edit Profile",
                      //     style: TextStyle(
                      //         color: Colors.white,
                      //         fontWeight: FontWeight.w600,
                      //         letterSpacing: 1.0),
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    SizedBox(height: 25),
                    Container(
                      width: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [
                              Color.fromRGBO(46, 170, 250, 1),
                              Color.fromRGBO(31, 47, 152, 1),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: TabBar(
                              unselectedLabelColor: Colors.white,
                              labelColor: Colors.black,
                              indicatorColor: Colors.white,
                              indicatorWeight: 2,
                              indicator: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              controller: tabController,
                              tabs: [
                                Tab(
                                  text: 'PERSONAL DETAILS',
                                ),
                                Tab(
                                  text: 'WORK EXPERIENCE',
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
                          Tab1(),
                          Tab2(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
