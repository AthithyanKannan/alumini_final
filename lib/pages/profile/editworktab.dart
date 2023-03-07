import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
class EditWorkTab extends StatefulWidget {
  const EditWorkTab({super.key});

  @override
  State<EditWorkTab> createState() => _EditWorkTabState();
}

class _EditWorkTabState extends State<EditWorkTab> {
  TextEditingController editdesignationcontroller = TextEditingController();
  TextEditingController editnamecontroller = TextEditingController();
  TextEditingController editlocationcontroller = TextEditingController();
  TextEditingController editdegreecontroller = TextEditingController();
  TextEditingController editaboutcontroller = TextEditingController();
  final List<String> editprofession = [
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
    if (item == editprofession[0]) {
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
    } else if (item == editprofession[1]) {
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
    } else if (item == editprofession[2]) {
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
      } else if (item == editprofession[3]) {
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
    } else if (item == editprofession[4]) {
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
    }else if (item == editprofession[5]) {
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
    }else if (item == editprofession[6]) {
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
    }else if (item == editprofession[7]) {
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
    }else if (item == editprofession[8]) {
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
      body: 
        Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 1),
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
                items: editprofession
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
            // if(isIndustry){
            //       Column(
            //     children: [
            //       EditWorkTextBox('Designation', designationcontroller),
            //       EditWorkTextBox('Industry Name', namecontroller),
            //       EditWorkTextBox(' Location', locationcontroller),
            //     ],
            //   ),
            // }
             
            // if (isStudies)
            //   Column(
            //     children: [
            //       WorkTextBox('Collage/institute', namecontroller),
            //       WorkTextBox('location', locationcontroller),
            //       WorkTextBox('Degree', degreecontroller),
            //     ],
            //   ),
            // if (isbusniess)
            //   Column(
            //     children: [
            //       WorkTextBox('About business', aboutcontroller),
            //       WorkTextBox('location', locationcontroller)
            //     ],
            //   ),
            //   if (isExam)
            //   Column(
            //     children: [
            //       WorkTextBox('Institute name', namecontroller),
            //       WorkTextBox('Degree', degreecontroller),
            //       WorkTextBox('location', locationcontroller)
            //     ],
            //   ),
            //   if (isTrainer)
            //   Column(
            //     children: [
            //       WorkTextBox('Working at', namecontroller),
            //       WorkTextBox('location', locationcontroller),
            //       WorkTextBox('Designation', designationcontroller)
            //     ],
            //   ),
            //   if (isBank)
            //   Column(
            //     children: [
            //       WorkTextBox('Institute name', namecontroller),
            //       WorkTextBox('Designation', designationcontroller),
            //       WorkTextBox('location', locationcontroller)
            //     ],
            //   ),
            //   if (isSearch)
            //   Column(
            //     children: [
            //       WorkTextBox('About business', aboutcontroller),
            //       WorkTextBox('location', locationcontroller)
            //     ],
            //   ),
            //   if (isHousewife)
            //   Column(
            //     children: [
            //       WorkTextBox('About', aboutcontroller),
            //     ],
            //   ),
            //   if (isGovt)
            //   Column(
            //     children: [
            //       WorkTextBox('Designation', designationcontroller),
            //       WorkTextBox('location', locationcontroller)
            //     ],
            //   ),
            // if (isOther)
            //   Column(
            //     children: [
            //       WorkTextBox('About', aboutcontroller)
            //     ],
            //   ),
    );

  }
    Widget EditWorkTextBox(String hint, TextEditingController controller) {
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