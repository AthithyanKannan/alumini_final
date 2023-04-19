import 'package:alumini_final/auth/login_screen.dart';
import 'package:alumini_final/colors.dart';
import 'package:alumini_final/pages/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
export 'update_profile.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

Color primary = const Color.fromARGB(255, 103, 58, 183);
String birth = "Date of Birth";

class _UpdateScreenState extends State<UpdateScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _batchController = TextEditingController();
  final TextEditingController _branchController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _industrydesignationcontroller =
      TextEditingController();
  final TextEditingController _industrynamecontroller = TextEditingController();
  final TextEditingController _industrylocationcontroller =
      TextEditingController();
  final TextEditingController _startdatecontroller = TextEditingController();
  final TextEditingController _enddatecontroller = TextEditingController();
  final TextEditingController _highcollegecontroller = TextEditingController();
  final TextEditingController _studylocationcontroller =
      TextEditingController();
  final TextEditingController _degreecontroller = TextEditingController();
  final TextEditingController _businessdesignationcontroller =
      TextEditingController();
  final TextEditingController _aboutbusinesscontroller =
      TextEditingController();
  final TextEditingController _businesslocationcontroller =
      TextEditingController();
  final TextEditingController _instituteowncontroller = TextEditingController();
  final TextEditingController _exampreparecontroller = TextEditingController();
  final TextEditingController _examlocation = TextEditingController();
  final TextEditingController _banknamecontroller = TextEditingController();
  final TextEditingController _bankdesignationcontroller =
      TextEditingController();
  final TextEditingController _banklocationcontroller = TextEditingController();
  final TextEditingController _trainingplatformcontroller =
      TextEditingController();
  final TextEditingController _traininglocationcontroller =
      TextEditingController();
  final TextEditingController _trainingrolecontroller = TextEditingController();
  final TextEditingController _searchaboutcontroller = TextEditingController();
  final TextEditingController _skillsatcontroller = TextEditingController();
  final TextEditingController _searchlocationcontroller =
      TextEditingController();
  final TextEditingController _govtdesignationcontroller =
      TextEditingController();
  final TextEditingController _govtlocationcontroller = TextEditingController();
  final TextEditingController _otheraboutcontroller = TextEditingController();
  final TextEditingController _number1controller = TextEditingController();

  List<String> profession = [
    'Industry',
    'Higher Studies',
    'Entrepreneur',
    'Competitive Exams',
    'Trainers',
    'Banking sectors',
    'Searching job',
    'Government job',
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
      isHousewife = false,
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
    } else if (item == profession[5]) {
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
    } else if (item == profession[6]) {
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
    } else if (item == profession[7]) {
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
    } else {
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
  void dispose() {
    _nameController.dispose();
    _batchController.dispose();
    _branchController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('users');

  Future addIndustryUserDetails(
      String name,
      String batch,
      String branch,
      String dob,
      String designation,
      String industryname,
      String location,
      String email,
      String number) async {
    await FirebaseFirestore.instance.collection('users').add({
      'name': name,
      'batch': batch,
      'branch': branch,
      'dob': dob,
      'designation': designation,
      'industryname': industryname,
      'location': location,
      'email': email,
      'number': "1",
    });
  }

  Future addStudiesUserDetails(
      String name,
      String batch,
      String branch,
      String dob,
      String highstudycollege,
      String degree,
      String highstudylocation,
      String startdate,
      String enddate,
      String email,
      String number) async {
    await FirebaseFirestore.instance.collection('users').add({
      'name': name,
      'batch': batch,
      'branch': branch,
      'dob': dob,
      'higheducation': highstudycollege,
      'degree': degree,
      'higheducationlocation': highstudylocation,
      'start date': startdate,
      'end date': enddate,
      'email': email,
      'number': "2",
    });
  }

  Future addBusinessUserDetails(
    String name,
    String batch,
    String branch,
    String dob,
    String designation,
    String aboutbusiness,
    String location,
    String email,
    String number,
  ) async {
    await FirebaseFirestore.instance.collection('users').add({
      'name': name,
      'batch': batch,
      'branch': branch,
      'dob': dob,
      'designation': designation,
      'about business': aboutbusiness,
      'location': location,
      'email': email,
      'number': '3'
    });
  }

  Future addExamUserDetails(
      String name,
      String batch,
      String branch,
      String dob,
      String institute,
      String preparingfor,
      String location,
      String email,
      String number) async {
    await FirebaseFirestore.instance.collection('users').add({
      'name': name,
      'batch': batch,
      'branch': branch,
      'dob': dob,
      'instituteown': institute,
      'preparing for': preparingfor,
      'location': location,
      'email': email,
      'number': '4'
    });
  }

  Future addTrainerUserDetails(
      String name,
      String batch,
      String branch,
      String dob,
      String trainingplatform,
      String trainingrole,
      String traininglocation,
      String email,
      String number) async {
    await FirebaseFirestore.instance.collection('users').add({
      'name': name,
      'batch': batch,
      'branch': branch,
      'dob': dob,
      'institute/college': trainingplatform,
      'training role': trainingplatform,
      'training location': traininglocation,
      'email': email,
      'number': '5'
    });
  }

  Future addBankUserDetails(
      String name,
      String batch,
      String branch,
      String dob,
      String bankname,
      String designation,
      String location,
      String email,
      String number) async {
    await FirebaseFirestore.instance.collection('users').add({
      'name': name,
      'batch': batch,
      'branch': branch,
      'dob': dob,
      'bank name': bankname,
      'designation': designation,
      'location': location,
      'email': email,
      'number': '6'
    });
  }

  Future addSearchUserDetails(
      String name,
      String batch,
      String branch,
      String dob,
      String searchfor,
      String skillsat,
      String location,
      String email,
      String number) async {
    await FirebaseFirestore.instance.collection('users').add({
      'name': name,
      'batch': batch,
      'branch': branch,
      'dob': dob,
      'searching for': searchfor,
      'skills at': skillsat,
      'location': location,
      'email': email,
      'number': '7'
    });
  }

  Future addGovtUserDetails(
      String name,
      String batch,
      String branch,
      String dob,
      String designation,
      String location,
      String email,
      String number) async {
    await FirebaseFirestore.instance.collection('users').add({
      'name': name,
      'batch': batch,
      'branch': branch,
      'dob': dob,
      'designation': designation,
      'location': location,
      'email': email,
      'number': '8'
    });
  }

  Future addIsOtherUserDetails(String name, String batch, String branch,
      String dob, String other, String email, String number) async {
    await FirebaseFirestore.instance.collection('users').add({
      'name': name,
      'batch': batch,
      'branch': branch,
      'dob': dob,
      'other': other,
      'email': email,
      'number': '9'
    });
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
                  height: MediaQuery.of(context).size.height / 4,
                  width: double.infinity,
                  decoration: BoxDecoration(color: primaryColor),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 60.0, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Complete your",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        Text(
                          "Profile",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 70,
            ),
            UpdateTextBox('Name', _nameController, TextInputType.name),
            UpdateTextBox('Batch', _batchController, TextInputType.number),
            UpdateTextBox('Branch', _branchController, TextInputType.name),
            UpdateTextBox('DOB', _dobController, TextInputType.datetime),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: const TextSpan(
                        text: 'Add your ',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                        children: [
                          TextSpan(
                              text: 'Working Experience',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold))
                        ]),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 1),
              margin: const EdgeInsets.symmetric(vertical: 8),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(217, 217, 217, 1.0),
                  borderRadius: BorderRadius.circular(12)),
              child: DropdownButtonFormField2(
                alignment: AlignmentDirectional.topStart,
                itemPadding: const EdgeInsets.symmetric(horizontal: 20),
                hint: const Text('Current Status',
                    style: TextStyle(fontSize: 15)),
                icon: const Icon(Icons.arrow_drop_down),
                iconEnabledColor: const Color.fromRGBO(5, 68, 94, 35.0),
                iconDisabledColor: const Color.fromRGBO(217, 217, 217, 1.0),
                buttonHeight: 22,
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
                  WorkTextBox('Designation', _industrydesignationcontroller),
                  WorkTextBox('Industry Name', _industrynamecontroller),
                  WorkTextBox('Location', _industrylocationcontroller),
                ],
              ),
            if (isStudies)
              Column(
                children: [
                  WorkTextBox('College/Institute', _highcollegecontroller),
                  WorkTextBox('Degree', _degreecontroller),
                  WorkTextBox('Location', _studylocationcontroller),
                  WorkTextBox("Start Date", _startdatecontroller),
                  WorkTextBox("End Date", _enddatecontroller)
                ],
              ),
            if (isbusniess)
              Column(
                children: [
                  WorkTextBox('Designation', _businessdesignationcontroller),
                  WorkTextBox('About business', _aboutbusinesscontroller),
                  WorkTextBox('Location', _businesslocationcontroller),
                ],
              ),
            if (isExam)
              Column(
                children: [
                  WorkTextBox("At Institute Or Own", _instituteowncontroller),
                  WorkTextBox('Preparing For', _exampreparecontroller),
                  WorkTextBox('Location', _examlocation)
                ],
              ),
            if (isTrainer)
              Column(
                children: [
                  WorkTextBox('College/Institute', _trainingplatformcontroller),
                  WorkTextBox('Training Role', _trainingrolecontroller),
                  WorkTextBox('Location', _traininglocationcontroller),
                ],
              ),
            if (isBank)
              Column(
                children: [
                  WorkTextBox('Bank name', _banknamecontroller),
                  WorkTextBox('Designation', _bankdesignationcontroller),
                  WorkTextBox('Location', _banklocationcontroller)
                ],
              ),
            if (isSearch)
              Column(
                children: [
                  WorkTextBox('Searching For', _searchaboutcontroller),
                  WorkTextBox('Skills', _skillsatcontroller),
                  WorkTextBox('Location', _searchlocationcontroller)
                ],
              ),
            if (isGovt)
              Column(
                children: [
                  WorkTextBox('Designation', _govtdesignationcontroller),
                  WorkTextBox('Location', _govtlocationcontroller)
                ],
              ),
            if (isOther)
              Column(
                children: [WorkTextBox('About', _otheraboutcontroller)],
              ),
            ElevatedButton(
                onPressed: () {
                  if (isIndustry == true) {
                    addIndustryUserDetails(
                      _nameController.text.trim(),
                      _batchController.text.trim(),
                      _branchController.text.trim(),
                      _dobController.text.trim(),
                      _industrydesignationcontroller.text.trim(),
                      _industrynamecontroller.text.trim(),
                      _industrylocationcontroller.text.trim(),
                      emailcontroller.text.trim(),
                      _number1controller.text.trim(),
                    );
                  }
                  if (isStudies == true) {
                    addStudiesUserDetails(
                        _nameController.text.trim(),
                        _batchController.text.trim(),
                        _branchController.text.trim(),
                        _dobController.text.trim(),
                        _highcollegecontroller.text.trim(),
                        _degreecontroller.text.trim(),
                        _studylocationcontroller.text.trim(),
                        _startdatecontroller.text.trim(),
                        _enddatecontroller.text.trim(),
                        emailcontroller.text.trim(),
                        _number1controller.text.trim());
                  }
                  if (isbusniess == true) {
                    addBusinessUserDetails(
                        _nameController.text.trim(),
                        _batchController.text.trim(),
                        _branchController.text.trim(),
                        _dobController.text.trim(),
                        _businessdesignationcontroller.text.trim(),
                        _aboutbusinesscontroller.text.trim(),
                        _businesslocationcontroller.text.trim(),
                        emailcontroller.text.trim(),
                        _number1controller.text.trim());
                  }

                  if (isExam == true) {
                    addExamUserDetails(
                        _nameController.text.trim(),
                        _batchController.text.trim(),
                        _branchController.text.trim(),
                        _dobController.text.trim(),
                        _instituteowncontroller.text.trim(),
                        _exampreparecontroller.text.trim(),
                        _examlocation.text.trim(),
                        emailcontroller.text.trim(),
                        _number1controller.text.trim());
                  }
                  if (isTrainer == true) {
                    addTrainerUserDetails(
                        _nameController.text.trim(),
                        _batchController.text.trim(),
                        _branchController.text.trim(),
                        _dobController.text.trim(),
                        _trainingplatformcontroller.text.trim(),
                        _trainingrolecontroller.text.trim(),
                        _traininglocationcontroller.text.trim(),
                        emailcontroller.text.trim(),
                        _number1controller.text.trim());
                  }
                  if (isBank == true) {
                    addBankUserDetails(
                        _nameController.text.trim(),
                        _batchController.text.trim(),
                        _branchController.text.trim(),
                        _dobController.text.trim(),
                        _banknamecontroller.text.trim(),
                        _bankdesignationcontroller.text.trim(),
                        _banklocationcontroller.text.trim(),
                        emailcontroller.text.trim(),
                        _number1controller.text.trim());
                  }
                  if (isSearch == true) {
                    addSearchUserDetails(
                        _nameController.text.trim(),
                        _batchController.text.trim(),
                        _branchController.text.trim(),
                        _dobController.text.trim(),
                        _searchaboutcontroller.text.trim(),
                        _skillsatcontroller.text.trim(),
                        _searchlocationcontroller.text.trim(),
                        emailcontroller.text.trim(),
                        _number1controller.text.trim());
                  }

                  if (isGovt == true) {
                    addGovtUserDetails(
                        _nameController.text.trim(),
                        _batchController.text.trim(),
                        _branchController.text.trim(),
                        _dobController.text.trim(),
                        _govtdesignationcontroller.text.trim(),
                        _govtlocationcontroller.text.trim(),
                        emailcontroller.text.trim(),
                        _number1controller.text.trim());
                  }
                  if (isOther == true) {
                    addIsOtherUserDetails(
                        _nameController.text.trim(),
                        _batchController.text.trim(),
                        _branchController.text.trim(),
                        _dobController.text.trim(),
                        _otheraboutcontroller.text.trim(),
                        emailcontroller.text.trim(),
                        _number1controller.text.trim());
                  }
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                      (route) => false);
                },
                child: Text('Save'),
                style: ButtonStyle(
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 15)),
                    backgroundColor: MaterialStateProperty.all(primaryColor),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            horizontal: 80, vertical: 15)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)))))
          ],
        ),
      ),
    );
  }

  Widget UpdateTextBox(
      String hint, TextEditingController controller, TextInputType type) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      margin: const EdgeInsets.symmetric(vertical: 12),
      width: size.width * 0.9,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(217, 217, 217, 1.0),
          borderRadius: BorderRadius.circular(12)),
      height: 50,
      child: TextFormField(
        keyboardType: type,
        cursorColor: Colors.black,
        textCapitalization: TextCapitalization.sentences,
        controller: controller,
        decoration: InputDecoration(hintText: hint, border: InputBorder.none),
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

  Widget WorkTextBox(String hint, TextEditingController controller) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      margin: EdgeInsets.symmetric(vertical: 12),
      width: size.width * 0.9,
      decoration: BoxDecoration(
          color: Color.fromRGBO(217, 217, 217, 1.0),
          borderRadius: BorderRadius.circular(12)),
      height: 50,
      child: TextFormField(
        cursorColor: Colors.black,
        textCapitalization: TextCapitalization.sentences,
        controller: controller,
        decoration: InputDecoration(hintText: hint, border: InputBorder.none),
      ),
    );
  }
}
