import 'package:alumini_final/colors.dart';
import 'package:flutter/material.dart';

class EditMyProfile extends StatefulWidget {
  const EditMyProfile({super.key});

  @override
  State<EditMyProfile> createState() => _EditMyProfileState();
}

class _EditMyProfileState extends State<EditMyProfile> {
   final List<String> editprofession = [
    'Working at',
    'Higher Studies',
    'Entrepreneur',
    'Other'
  ];
  String? selectedValue;
  final _formKey = GlobalKey<FormState>();
  bool isWork = false, isStudies = false, isbusniess = false, isOther = false;

  viewFields(item) {
    if (item == editprofession[0]) {
      isWork = true;
      isStudies = false;
      isbusniess = false;
      isOther = false;
    } else if (item == editprofession[1]) {
      isWork = false;
      isStudies = true;
      isbusniess = false;
      isOther = false;
    } else if (item == editprofession[2]) {
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
  TextEditingController editnamecontroller = TextEditingController();
  TextEditingController editbatchcontroller = TextEditingController();
  TextEditingController editbranchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Edit Profile',
          style: TextStyle(color: Colors.black87),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black87,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.check),
            color: Colors.black87,
          ),
        ],
        elevation: 0,
      ),
      body: Container(
        height: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(height: 20),
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.black,
                  child: Icon(Icons.person,
                  size: 50,
                  color: Colors.white,
                  ),
                ),
                SizedBox(height: 20,),
              ],
            ),
          ],
        ),
      ),
    );
  }
  }
