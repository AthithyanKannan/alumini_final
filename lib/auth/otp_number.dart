import 'dart:ui';
import 'package:alumini_final/auth/otp_verification.dart';
import 'package:alumini_final/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OtpNumber extends StatefulWidget {
  const OtpNumber({super.key});

  @override
  State<OtpNumber> createState() => _OtpNumberState();
}

class _OtpNumberState extends State<OtpNumber> {
  @override
  Widget build(BuildContext context) {
    var numbercontroller = TextEditingController();
    return Scaffold(
      backgroundColor: BackgroundColor,
      appBar: AppBar(
        backgroundColor: BackgroundColor,
        elevation: 0,
        // title: Text(
        //   "Enter your Number to verify",
        //   style: TextStyle(
        //     color: primaryColor
        //   ),
        // ),
        // centerTitle: true
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
                    text: const TextSpan(
                        text: 'We will send you an ',
                        style: TextStyle(color: Colors.grey),
                        children: [
                      TextSpan(
                          text: 'One Time Password',
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
                      decoration: const InputDecoration(prefixText: '+91'),
                      keyboardType: TextInputType.number,
                    )),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OtpVerification(),
                          ));
                    },
                    child: const Text('Proceed'),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(primaryColor),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                horizontal: 80, vertical: 15)),
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
