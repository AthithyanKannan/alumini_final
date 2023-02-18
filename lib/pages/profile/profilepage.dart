import 'dart:ui';
import 'package:alumini_final/colors.dart';
import 'package:alumini_final/pages/profile/edit_myprofie.dart';
import 'package:alumini_final/pages/update_screens/update_profile.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
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
                                      builder: (context) => UpdateScreen(),
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
      // body: Column(
      //   children: [
      //     Stack(
      //       clipBehavior: Clip.none,
      //       children: [
      //         Container(
      //             height: MediaQuery.of(context).size.height / 4,
      //             color: primaryColor),
      //         Padding(
      //           padding: const EdgeInsets.fromLTRB(40, 40, 40, 0),
      //           child: Container(
      //             height: MediaQuery.of(context).size.height / 3.4,
      //             width: double.infinity,
      //             decoration: BoxDecoration(
      //                 color: Colors.white,
      //                 borderRadius: BorderRadius.circular(12),
      //                 boxShadow: const [
      //                   BoxShadow(
      //                       color: Colors.black87,
      //                       offset: Offset.zero,
      //                       spreadRadius: 1,
      //                       blurRadius: 15,
      //                       blurStyle: BlurStyle.normal)
      //                 ]),
      //             child: Column(
      //               children: const [
      //                 SizedBox(
      //                   height: 20,
      //                 ),
      //                 CircleAvatar(
      //                     radius: 50,
      //                     backgroundColor: Colors.black,
      //                     backgroundImage: AssetImage('assets/Athi.jpg')),
      //                 SizedBox(
      //                   height: 10,
      //                 ),
      //                 Text(
      //                   'Athithyan K',
      //                   style: TextStyle(
      //                     fontFamily: 'Roboto',
      //                     fontSize: 20,
      //                   ),
      //                 ),
      //                 Text(
      //                   'Mobile App Developer',
      //                   style: TextStyle(
      //                       fontSize: 13,
      //                       fontFamily: 'Roboto',
      //                       color: Colors.black87),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //         Positioned(
      //           top: MediaQuery.of(context).size.height / 3.1,
      //           left: 120,
      //           child: InkWell(
      //             onTap: () {
      //               Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                     builder: (context) => EditMyProfile(),
      //                   ));
      //             },
      //             child: Container(
      //               padding: const EdgeInsets.only(
      //                   left: 20, right: 20, top: 10, bottom: 10),
      //               decoration: BoxDecoration(
      //                   color: secondaryColor,
      //                   borderRadius: BorderRadius.circular(30)),
      //               child: const Text(
      //                 'Edit Profile',
      //                 style: TextStyle(
      //                     fontSize: 16,
      //                     fontFamily: 'Roboto',
      //                     color: Colors.white),
      //               ),
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //     const SizedBox(
      //       height: 40,
      //     ),
      //     Container(
      //       padding: const EdgeInsets.only(left: 20, right: 20),
      //       width: MediaQuery.of(context).size.width / 1.2,
      //       height: MediaQuery.of(context).size.height / 2.6,
      //       decoration: BoxDecoration(
      //           color: Colors.white,
      //           borderRadius: BorderRadius.circular(12),
      //           boxShadow: const [
      //             BoxShadow(
      //                 color: Colors.black87,
      //                 offset: Offset.zero,
      //                 spreadRadius: 1,
      //                 blurRadius: 10,
      //                 blurStyle: BlurStyle.outer)
      //           ]),
      //       child: Expanded(
      //         child: SingleChildScrollView(
      //           scrollDirection: Axis.vertical,
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               const SizedBox(
      //                 height: 10,
      //               ),
      //               const Text(
      //                 'Batch',
      //                 style: TextStyle(fontFamily: 'Roboto', fontSize: 18),
      //               ),
      //               const SizedBox(
      //                 height: 10,
      //               ),
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.start,
      //                 children: [
      //                   Text(
      //                     '2025',
      //                     style: TextStyle(
      //                         fontFamily: 'Roboto',
      //                         fontSize: 16,
      //                         color: Colors.grey[600]),
      //                   )
      //                 ],
      //               ),
      //               const SizedBox(height: 20),
      //               const Text(
      //                 'Branch',
      //                 style: TextStyle(
      //                   fontSize: 18,
      //                   fontFamily: 'Roboto',
      //                 ),
      //               ),
      //               const SizedBox(
      //                 height: 10,
      //               ),
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.start,
      //                 children: [
      //                   Text(
      //                     'ISE',
      //                     style: TextStyle(
      //                         fontFamily: 'Roboto',
      //                         fontSize: 16,
      //                         color: Colors.grey[600]),
      //                   ),
      //                 ],
      //               ),
      //               const SizedBox(
      //                 height: 20,
      //               ),
      //               const Text(
      //                 'Date of Birth',
      //                 style: TextStyle(
      //                   fontSize: 18,
      //                   fontFamily: 'Roboto',
      //                 ),
      //               ),
      //               const SizedBox(
      //                 height: 10,
      //               ),
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.start,
      //                 children: [
      //                   Text(
      //                     '13.04.2004',
      //                     style: TextStyle(
      //                         fontFamily: 'Roboto',
      //                         fontSize: 16,
      //                         color: Colors.grey[600]),
      //                   )
      //                 ],
      //               ),
      //               const SizedBox(height: 20),
      //               const Text(
      //                 'Working At:',
      //                 style: TextStyle(
      //                   fontSize: 18,
      //                   fontFamily: 'Roboto',
      //                 ),
      //               ),
      //               const SizedBox(
      //                 height: 10,
      //               ),
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.start,
      //                 children: [
      //                   Text(
      //                     'ZOHO',
      //                     style: TextStyle(
      //                         fontFamily: 'Roboto',
      //                         fontSize: 16,
      //                         color: Colors.grey[600]),
      //                   ),
      //                 ],
      //               ),
      //               const SizedBox(
      //                 height: 20,
      //               ),
      //               const Text(
      //                 'Role',
      //                 style: TextStyle(
      //                   fontSize: 18,
      //                   fontFamily: 'Roboto',
      //                 ),
      //               ),
      //               const SizedBox(
      //                 height: 10,
      //               ),
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.start,
      //                 children: [
      //                   Text(
      //                     'App Developer',
      //                     style: TextStyle(
      //                         fontFamily: 'Roboto',
      //                         fontSize: 16,
      //                         color: Colors.grey[600]),
      //                   )
      //                 ],
      //               ),
      //               const SizedBox(
      //                 height: 20,
      //               ),
      //               const Text(
      //                 'Company Location',
      //                 style: TextStyle(
      //                   fontSize: 18,
      //                   fontFamily: 'Roboto',
      //                 ),
      //               ),
      //               const SizedBox(
      //                 height: 10,
      //               ),
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.start,
      //                 children: [
      //                   Text(
      //                     'Bangalore',
      //                     style: TextStyle(
      //                         fontFamily: 'Roboto',
      //                         fontSize: 16,
      //                         color: Colors.grey[600]),
      //                   )
      //                 ],
      //               ),
      //               const SizedBox(
      //                 height: 20,
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //     )
      //   ],
      // ),
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 4,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'My',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      Text(
                        "Profile",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 27),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 100,
                left: 20,
                right: 20,
                child: Container(
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: Colors.black87, blurRadius: 12)
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Athithyan K',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "BE Student",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: 50,
                  left: 20,
                  right: 20,
                  child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.black,

                      )
                      
                      )
            ],
          ),
        ],
      ),
    );
  }
}
