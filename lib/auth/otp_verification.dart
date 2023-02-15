import 'dart:async';

import 'package:alumini_final/auth/otp_number.dart';
import 'package:alumini_final/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OtpVerification extends StatefulWidget {

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColor,
      appBar: AppBar(
        backgroundColor: BackgroundColor,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SvgPicture.asset(
                  'assets/otpscreen.svg',
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 2.7,
                ),
                const Text(
                  'OTP Verification',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                    text: TextSpan(
                        text: 'Enter the OTP send to ',
                        style: TextStyle(color: Colors.grey),
                        children: [
                      TextSpan(
                          text: '',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold))
                    ])),
                const SizedBox(
                  height: 2,
                ),
                const Text(
                  'on this mobile number',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Enter Mobile Number',
                  style: TextStyle(color: Colors.grey),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                    )),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: const Text('Proceed'),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(primaryColor),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                horizontal: 60, vertical: 15)),
                        elevation: MaterialStateProperty.all(8),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)))))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
