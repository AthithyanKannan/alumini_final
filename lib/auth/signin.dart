// import 'package:alumini_final/auth/otp_verification.dart';
// import 'package:alumini_final/colors.dart';
// import 'package:alumini_final/pages/update_screens/update_profile.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   @override
//   Widget build(BuildContext context) {
   

//     return Scaffold(
//       backgroundColor: Colors.grey[300],
//       body: SafeArea(
//           child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.lock,
//               size: 100,
//             ),
//             //hello again!
//             SizedBox(
//               height: 20,
//             ),
//             Text(
//               'Alumni Connect',
//               style: TextStyle(
//                 fontFamily: 'BebasNeue',
//                 letterSpacing: 1,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 28,
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Text(
//               'Welcome',
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 20,
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 25),
//               child: Container(
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(12)),
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 20),
//                   child: TextField(
//                     controller: _emailcontroller,
//                     decoration: InputDecoration(
//                         border: InputBorder.none, hintText: 'Email'),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 25),
//               child: Container(
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(12)),
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 20),
//                   child: TextField(
//                     controller: _rolln0controller,
//                     decoration: InputDecoration(
//                         border: InputBorder.none, hintText: 'Roll-No'),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 signin();
//                 Navigator.pushAndRemoveUntil(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => UpdateScreen(),
//                     ),
//                     (route) => false);
//                 showDialog(
//                     context: context,
//                     builder: ((context) {
//                       return Center(
//                         child: CircularProgressIndicator(),
//                       );
//                     }));
//                 Navigator.pop(context);
//               },
//               child: Text('Sign-in'),
//               style: ButtonStyle(
//                   padding: MaterialStateProperty.all(
//                     EdgeInsets.symmetric(vertical: 15, horizontal: 40),
//                   ),
//                   backgroundColor: MaterialStateProperty.all(primaryColor)),
//             ),
//           ],
//         ),
//       )),
//     );
//   }
// }
