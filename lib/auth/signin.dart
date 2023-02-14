
import 'package:alumini_final/colors.dart';
import 'package:alumini_final/pages/update_screens/update_profile.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: BackgroundColor,
          body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
                height: MediaQuery.of(context).size.height / 2,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [
                      Color.fromRGBO(0, 36, 72, 1.0),
                      Color.fromRGBO(5, 25, 55, 1.0),
                    ])),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 65.0,
                      backgroundColor: Colors.white,
                      child: Image.asset(
                        'assets/logo symbol.png',
                        width: 120,
                        height: 120,
                      ),
                    ),
                  ],
                )),
          ),
          Positioned(
            top: 310,
            left: 25,
            right: 25,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black,
                        blurRadius: 10.0,
                        spreadRadius: 1.0),
                    BoxShadow(
                        color: Colors.black, blurRadius: 0.0, spreadRadius: 0.0)
                  ],
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                    child: Row(
                      children: const [
                        Text(
                          "Sign-Up",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Roboto'
                              ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                    child: Row(
                      children:  [
                        const Text(
                          'Please Register to Continue',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                              ),
                        ),
                      ],
                    ),
                  ),
                const  SizedBox(
                    height: 7,
                  ),
                  customTextBox(
                    "Enter Your Email",
                    Icons.person,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  customTextBox(
                    "Enter Your Roll No",
                    Icons.fact_check,
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width / 3.5,
            top: 540,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => UpdateScreen())));
              },
              child: const Text(
                'Continue',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white
                ),
                ),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                primary: Color.fromRGBO(0, 36, 72, 1.0),
                onPrimary: Color.fromRGBO(0, 36, 72, 1.0),
                onSurface:  Color.fromRGBO(5, 25, 55, 1.0), 
                padding: const EdgeInsets.only(
                    left: 45, right: 45, top: 17, bottom: 17),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
              
                    ),
              ),
            ),
          )
        ],
      )),
    );
  }

  Widget customTextBox(String hint, IconData icons) {
    Size size = MediaQuery.of(this.context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width*0.8,
      decoration: BoxDecoration(
          color: BackgroundColor,
          borderRadius: BorderRadius.circular(12)),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: hint,
            icon: Icon(icons, color: primaryColor),
            border: InputBorder.none),
      ),
      height: size.height/14,
    );
  }
}
