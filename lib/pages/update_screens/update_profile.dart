import 'package:alumini_final/colors.dart';
import 'package:alumini_final/pages/update_screens/update_work.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

Color primary = const Color.fromARGB(255, 103, 58, 183);
String birth = "Date of Birth";

class _UpdateScreenState extends State<UpdateScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController batchController = TextEditingController();
  TextEditingController branchController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController designationcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController locationcontroller = TextEditingController();
  TextEditingController degreecontroller = TextEditingController();
  TextEditingController aboutcontroller = TextEditingController();
  final List<String> profession = [
    'Industry',
    'Higher Studies',
    'Entrepreneur'
        'Competative exams',
    'Trainers',
    'Banking sectors',
    'Searching job',
    'Government job'
        'Other'
  ];

  String? selectedValue;
  final _formKey = GlobalKey<FormState>();
  bool isIndustry = false,
      isStudies = false,
      isbusniess = false,
      isExam = false,
      isTrainer = false,
      isBank = false,
      isSearch = false,
      isGovt = false,
      isOther = false;

  viewFields(item) {
    if (item == profession[0]) {
      isIndustry = true;
      isStudies = false;
      isbusniess = false;
      isExam = false;
      isTrainer = false;
      isBank = false;
      isSearch = false;
      isGovt = false;
      isOther = false;
    } else if (item == profession[1]) {
      isIndustry = false;
      isStudies = true;
      isbusniess = false;
      isExam = false;
      isTrainer = false;
      isBank = false;
      isSearch = false;
      isGovt = false;
      isOther = false;
    } else if (item == profession[2]) {
      isIndustry = false;
      isStudies = false;
      isbusniess = true;
      isExam = false;
      isTrainer = false;
      isBank = false;
      isSearch = false;
      isGovt = false;
      isOther = false;
    } else if (item == profession[3]) {
      isIndustry = false;
      isStudies = false;
      isbusniess = false;
      isExam = true;
      isTrainer = false;
      isBank = false;
      isSearch = false;
      isGovt = false;
      isOther = false;
    } else if (item == profession[4]) {
      isIndustry = false;
      isStudies = false;
      isbusniess = false;
      isExam = false;
      isTrainer = true;
      isBank = false;
      isSearch = false;
      isGovt = false;
      isOther = false;
    } else if (item == profession[5]) {
      isIndustry = false;
      isStudies = false;
      isbusniess = false;
      isExam = false;
      isTrainer = false;
      isBank = true;
      isSearch = false;
      isGovt = false;
      isOther = false;
    } else if (item == profession[6]) {
      isIndustry = false;
      isStudies = false;
      isbusniess = false;
      isExam = false;
      isTrainer = false;
      isBank = false;
      isSearch = true;
      isGovt = false;
      isOther = false;
    } else if (item == profession[7]) {
      isIndustry = false;
      isStudies = false;
      isbusniess = false;
      isExam = false;
      isTrainer = false;
      isBank = false;
      isSearch = false;
      isGovt = true;
      isOther = false;
    } else {
      isIndustry = false;
      isStudies = false;
      isbusniess = false;
      isExam = false;
      isTrainer = false;
      isBank = false;
      isSearch = false;
      isGovt = false;
      isOther = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: BackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 5,
                  width: double.infinity,
                  decoration: BoxDecoration(color: primaryColor),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "data",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text("data")
                    ],
                  ),
                ),
                const Positioned(
                  top: 115,
                  left: 130,
                  child: CircleAvatar(
                    radius: 50,
                    child: Icon(
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
            // Padding(
            //   padding: const EdgeInsets.symmetric(
            //     horizontal: 20,
            //   ),
            //   child: GestureDetector(
            //     onTap: () async {
            //       String Name = nameController.text;
            //       String Batch = batchController.text;
            //       String Branch = branchController.text;
            //       String DOB = dobController.text;

            //       if (Name.isEmpty) {
            //         showSnackBar("Enter your Name");
            //       } else if (Batch.isEmpty) {
            //         showSnackBar("Enter your Batch and Branch");
            //       } else if (Branch.isEmpty) {
            //         showSnackBar("Enter your Mobile No.");
            //       } else if (DOB.isEmpty) {
            //         showSnackBar("Enter your DOB");
            //       } else {}
            //     },
            //   ),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.end,
            //       children: [
            //         InkWell(
            //           onTap: () {
            //             Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                     builder: (context) => UpdateWorkScreen()));
            //           },
            //           child: Container(
            //             padding:
            //                 EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            //             decoration: BoxDecoration(
            //                 color: primaryColor,
            //                 borderRadius: BorderRadius.circular(30)),
            //             child: Text(
            //               'Next->',
            //               style: TextStyle(color: Colors.white, fontSize: 18),
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 1),
              margin: EdgeInsets.symmetric(vertical: 8),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(217, 217, 217, 1.0),
                  borderRadius: BorderRadius.circular(12)),
              child: DropdownButtonFormField2(
                hint: Text('Current Status', style: TextStyle(fontSize: 15)),
                icon: Icon(Icons.arrow_drop_down),
                iconEnabledColor: Color.fromRGBO(5, 68, 94, 35.0),
                iconDisabledColor: Color.fromRGBO(217, 217, 217, 1.0),
                buttonHeight: 30,
                isDense: true,
                items: profession
                    .map((e) => DropdownMenuItem<String>(
                          value: e,
                          child: Text(
                            e,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ))
                    .toList(),
                onChanged: (value) {
                  viewFields(value);
                },
              ),
            ),
            if (isIndustry)
              Column(
                children: [
                  WorkTextBox('Designation', designationcontroller),
                  WorkTextBox('Industry Name', namecontroller),
                  WorkTextBox(' Location', locationcontroller),
                ],
              ),
            if (isStudies)
              Column(
                children: [
                  WorkTextBox('Collage/institute', namecontroller),
                  WorkTextBox('location', locationcontroller),
                  WorkTextBox('Degree', degreecontroller),
                ],
              ),

            if (isbusniess)
              Column(
                children: [
                  WorkTextBox('About business', aboutcontroller),
                  WorkTextBox('location', locationcontroller)
                ],
              ),
            if (isExam)
              Column(
                children: [
                  WorkTextBox('Institute name', namecontroller),
                  WorkTextBox('Degree', degreecontroller),
                  WorkTextBox('location', locationcontroller)
                ],
              ),
            if (isTrainer)
              Column(
                children: [
                  WorkTextBox('Working at', namecontroller),
                  WorkTextBox('location', locationcontroller),
                  WorkTextBox('Designation', designationcontroller)
                ],
              ),
            if (isBank)
              Column(
                children: [
                  WorkTextBox('Institute name', namecontroller),
                  WorkTextBox('Designation', designationcontroller),
                  WorkTextBox('location', locationcontroller)
                ],
              ),
            if (isSearch)
              Column(
                children: [
                  WorkTextBox('About business', aboutcontroller),
                  WorkTextBox('location', locationcontroller)
                ],
              ),

            if (isGovt)
              Column(
                children: [
                  WorkTextBox('Designation', designationcontroller),
                  WorkTextBox('location', locationcontroller)
                ],
              ),
            if (isOther)
              Column(
                children: [WorkTextBox('About', aboutcontroller)],
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
        decoration: InputDecoration(hintText: hint, border: InputBorder.none),
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
        decoration: InputDecoration(hintText: hint, border: InputBorder.none),
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

  Widget WorkTextBox(String hint, TextEditingController controller) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      margin: EdgeInsets.symmetric(vertical: 12),
      width: size.width * 0.9,
      decoration: BoxDecoration(
          color: Color.fromRGBO(217, 217, 217, 1.0),
          borderRadius: BorderRadius.circular(8)),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(hintText: hint, border: InputBorder.none),
      ),
      height: 50,
    );
  }
}
