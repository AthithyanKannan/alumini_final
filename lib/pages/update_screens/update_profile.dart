import 'package:alumini_final/colors.dart';
import 'package:alumini_final/pages/update_screens/update_work.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

Color primary = const Color.fromARGB(255, 103, 58, 183);
String birth = "Date of Birth";

TextEditingController nameController = TextEditingController();
TextEditingController batchController = TextEditingController();
TextEditingController branchController = TextEditingController();
TextEditingController dobController = TextEditingController();

class _UpdateScreenState extends State<UpdateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  child: Container(
                    height: 170,
                    decoration:
                        BoxDecoration(color: primaryColor),
                  ),
                ),
               const  Positioned(
                  top: 115,
                  left: 130,
                  child: CircleAvatar(
                    radius: 50,
                     child:  Icon(
                      Icons.person,
                      color: Colors.black,
                      size: 60,
                    ),
                    backgroundColor: Color.fromRGBO(217, 217, 217, 1.0),
                  ),
                ),
              ],
            ),
           const SizedBox(
              height: 70,
            ),
            UpdateTextBox('Name', nameController),
            UpdateTextBox('Batch', batchController),
            UpdateTextBox('Branch', branchController),
            UpdateDateBox('DOB', dobController),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: GestureDetector(
                onTap: () async {
                  String Name = nameController.text;
                  String Batch = batchController.text;
                  String Branch = branchController.text;
                  String DOB = dobController.text;

                  if (Name.isEmpty) {
                    showSnackBar("Enter your Name");
                  } else if (Batch.isEmpty) {
                    showSnackBar("Enter your Batch and Branch");
                  } else if (Branch.isEmpty) {
                    showSnackBar("Enter your Mobile No.");
                  } else if (DOB.isEmpty) {
                    showSnackBar("Enter your DOB");
                  } else {}
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UpdateWorkScreen()));
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(30)),
                        child: Text(
                          'Next->',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget UpdateTextBox(String hint, TextEditingController controller) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      margin: EdgeInsets.symmetric(vertical: 12),
      width: size.width * 0.9,
      decoration: BoxDecoration(
          color: Color.fromRGBO(217, 217, 217, 1.0),
          borderRadius: BorderRadius.circular(12)),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            hintText: hint,
            border: InputBorder.none),
      ),
      height: 50,
    );
  }

  Widget UpdateDateBox(String hint, TextEditingController controller) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      margin: EdgeInsets.symmetric(vertical: 12),
      width: size.width * 0.9,
      decoration: BoxDecoration(
          color: Color.fromRGBO(217, 217, 217, 1.0),
          borderRadius: BorderRadius.circular(8)),
      child: TextFormField(
        keyboardAppearance: null,
        controller: controller,
        decoration: InputDecoration(
            hintText: hint,
            border: InputBorder.none),
        onTap: () async {
          DateTime? pickeddate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1950),
              lastDate: DateTime(2100));
          if (pickeddate != null) {
            setState(() {
              dobController.text = DateFormat('yyyy-mm-dd').format(pickeddate);
            });
          }
        },
      ),
      height: 50,
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

