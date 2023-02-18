import 'package:alumini_final/colors.dart';
import 'package:alumini_final/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../profile/profilepage.dart';

class UpdateWorkScreen extends StatefulWidget {
  const UpdateWorkScreen({super.key});

  @override
  State<UpdateWorkScreen> createState() => _UpdateWorkScreenState();
}

class _UpdateWorkScreenState extends State<UpdateWorkScreen> {
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
    'House wife',
    'Government job'
    'Other'
  ];
  String? selectedValue;
  final _formKey = GlobalKey<FormState>();
  bool isIndustry = false,isStudies = false, isbusniess = false,isExam = false, isTrainer = false,isBank = false,isSearch = false,isHousewife = false,isGovt = false,    isOther = false;

  viewFields(item) {
    if (item == profession[0]) {
      isIndustry = true;
      isStudies = false;
      isbusniess = false;
      isExam = false;
      isTrainer = false;
      isBank = false;
      isSearch = false;
      isHousewife = false;
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
      isHousewife = false;
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
      isHousewife = false;
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
      isHousewife = false;
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
      isHousewife = false;
      isGovt = false;
      isOther = false;
    }else if (item == profession[5]) {
      isIndustry = false;
      isStudies = false;
      isbusniess = false;
      isExam = false;
      isTrainer = false;
      isBank = true;
      isSearch = false;
      isHousewife = false;
      isGovt = false;
      isOther = false;
    }else if (item == profession[6]) {
      isIndustry = false;
      isStudies = false;
      isbusniess = false;
      isExam = false;
      isTrainer = false;
      isBank = false;
      isSearch = true;
      isHousewife = false;
      isGovt = false;
      isOther = false;
    }else if (item == profession[7]) {
      isIndustry = false;
      isStudies = false;
      isbusniess = false;
      isExam = false;
      isTrainer = false;
      isBank = false;
      isSearch = false;
      isHousewife = true;
      isGovt = false;
      isOther = false;
    }else if (item == profession[8]) {
      isIndustry = false;
      isStudies = false;
      isbusniess = false;
      isExam = false;
      isTrainer = false;
      isBank = false;
      isSearch = false;
      isHousewife = false;
      isGovt = true;
      isOther = false;
    }else {
      isIndustry = false;
      isStudies = false;
      isbusniess = false;
      isExam = false;
      isTrainer = false;
      isBank = false;
      isSearch = false;
      isHousewife = false;
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
          children: [
            Container(
              height: 170,
              decoration: BoxDecoration(color: primaryColor),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 1),
              margin: EdgeInsets.symmetric(vertical: 7),
              width: size.width * 0.6,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(217, 217, 217, 1.0),
                  borderRadius: BorderRadius.circular(12)),
              child: DropdownButtonFormField2(
                hint: Text('Current Status',
                    style: TextStyle(fontSize: 15)),
                icon: Icon(Icons.arrow_drop_down),
                iconEnabledColor: Color.fromRGBO(5, 68, 94, 35.0),
                iconDisabledColor: Color.fromRGBO(217, 217, 217, 1.0),
                buttonHeight: 22,
                isDense: true,
                items: profession
                    .map((e) => DropdownMenuItem<String>(
                          value: e,
                          child: Text(
                            e,
                            style: const TextStyle(
                                fontSize: 14),
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
              if (isHousewife)
              Column(
                children: [
                  WorkTextBox('About', aboutcontroller),
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
                children: [
                  WorkTextBox('About', aboutcontroller)
                ],
              ),
            InkWell(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: ((context) => HomeScreen())),
                    (route) => false);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(8)),
                child: Text(
                  'Save',
                  style: TextStyle(
                     fontSize: 18, color: Colors.white),
                ),
              ),
            )
          ],
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
        decoration: InputDecoration(
            hintText: hint,
            border: InputBorder.none),
      ),
      height: 50,
    );
  }
}