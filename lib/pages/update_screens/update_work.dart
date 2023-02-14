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
  TextEditingController destinationcontroller = TextEditingController();
  final List<String> profession = [
    'Working at',
    'Higher Studies',
    'Entrepreneur',
    'Other'
  ];
  String? selectedValue;
  final _formKey = GlobalKey<FormState>();
  bool isWork = false, isStudies = false, isbusniess = false, isOther = false;

  viewFields(item) {
    if (item == profession[0]) {
      isWork = true;
      isStudies = false;
      isbusniess = false;
      isOther = false;
    } else if (item == profession[1]) {
      isWork = false;
      isStudies = true;
      isbusniess = false;
      isOther = false;
    } else if (item == profession[2]) {
      isWork = false;
      isStudies = false;
      isbusniess = true;
      isOther = false;
    } else {
      isWork = false;
      isStudies = false;
      isbusniess = false;
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
            if (isWork)
              Column(
                children: [
                  WorkTextBox('Destination', destinationcontroller),
                  WorkTextBox('Destination', destinationcontroller),
                  WorkTextBox('Destination', destinationcontroller),
                ],
              ),
            if (isStudies)
              Column(
                children: [
                  WorkTextBox('Destination', destinationcontroller),
                  WorkTextBox('Destination', destinationcontroller),
                  WorkTextBox('Destination', destinationcontroller),
                ],
              ),
            if (isbusniess)
              Column(
                children: [
                  WorkTextBox('Destination', destinationcontroller),
                  WorkTextBox('Destination', destinationcontroller),
                  WorkTextBox('Destination', destinationcontroller),
                ],
              ),
            if (isOther)
              Column(
                children: [
                  WorkTextBox('Destination', destinationcontroller),
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
