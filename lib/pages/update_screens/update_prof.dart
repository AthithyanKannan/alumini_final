import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class editprofile extends StatefulWidget {
  const editprofile({super.key});

  @override
  State<editprofile> createState() => _editprofileState();
}

class _editprofileState extends State<editprofile> {
  double screenwidth = 0;
  Color primary = const Color.fromARGB(255, 103, 58, 183);
  String birth = "Date of Birth";

  TextEditingController nameController = TextEditingController();
  TextEditingController batchController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController bloodgrpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text(
          "Update your profile",
          style: TextStyle(
              fontFamily: 'Mulish-Semibold', fontSize: 20, color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.grey.withOpacity(0.5))
                        ],
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset("assets/profile.png"),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 4, color: Colors.white),
                              color: Colors.deepPurple.withOpacity(0.9)),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              textField("Name", nameController),
              textField("Batch & Branch", batchController),
              textField("Mobile no.", mobileController),
              textField("Blood group", bloodgrpController),
              GestureDetector(
                onTap: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1996),
                    lastDate: DateTime.now(),
                    builder: (context, child) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: ColorScheme.light(
                            primary: primary,
                            secondary: primary,
                            onSecondary: Colors.white,
                          ),
                          textButtonTheme: TextButtonThemeData(
                            style: TextButton.styleFrom(
                              primary: primary,
                            ),
                          ),
                          textTheme: const TextTheme(
                            headline4: TextStyle(fontFamily: 'Mulish-Semibold'),
                            overline: TextStyle(fontFamily: 'Mulish-Semibold'),
                            button: TextStyle(fontFamily: 'Mulish-Semibold'),
                          ),
                        ),
                        child: child!,
                      );
                    },
                  );
                  // ).then((value) {
                  //   setState(() {
                  //     birth = DateFormat("MM/dd/yyyy").format(value!);
                  //   });
                  // });
                },
                child: Container(
                  height: kToolbarHeight,
                  width: screenwidth,
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.only(left: 11),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: Colors.black,
                      )),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      birth,
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.3),
                          fontFamily: 'Mulish-Semibold',
                          fontSize: 16),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  String Name = nameController.text;
                  String Batch = batchController.text;
                  String Mobile = mobileController.text;
                  String Blood = bloodgrpController.text;
                  String birthDate = birth;

                  if (Name.isEmpty) {
                    showSnackBar("Enter your Name");
                  } else if (Batch.isEmpty) {
                    showSnackBar("Enter your Batch and Branch");
                  } else if (Mobile.isEmpty) {
                    showSnackBar("Enter your Mobile No.");
                  } else if (Blood.isEmpty) {
                    showSnackBar("Enter your Blood group");
                  } else if (birthDate.isEmpty) {
                    showSnackBar("Enter your DOB");
                  } else {}
                },
                child: Container(
                  height: kToolbarHeight,
                  width: screenwidth,
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.only(left: 11),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4), color: primary),
                  child: Center(
                    child: Text(
                      "Next",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Mulish-Semibold',
                          fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget textField(String hint, TextEditingController controller) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        cursorColor: Colors.deepPurple,
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
                color: Colors.black.withOpacity(0.3),
                fontFamily: 'Mulish-Semibold'),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black)),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black))),
      ),
    );
  }

  void showSnackBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(
          text,
        ),
      ),
    );
  }
}
