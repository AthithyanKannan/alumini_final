import 'package:flutter/material.dart';

class EditPersonalTab extends StatefulWidget {
  const EditPersonalTab({super.key});

  @override
  State<EditPersonalTab> createState() => _EditPersonalTabState();
}

class _EditPersonalTabState extends State<EditPersonalTab> {
  @override
  Widget build(BuildContext context) {
    TextEditingController EditnameController = TextEditingController();
    TextEditingController EditBatchController = TextEditingController();
    TextEditingController EditBranchController = TextEditingController();
    TextEditingController EditDobController = TextEditingController();
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 10,),
          EditTextBox('Name', EditnameController, TextInputType.name),
          EditTextBox('Batch', EditBatchController, TextInputType.number),
          EditTextBox('Branch', EditBranchController, TextInputType.name),
          EditTextBox('DOB', EditDobController, TextInputType.datetime),
        ],
      ),
    );
  }

  Widget EditTextBox(
      String hint, TextEditingController controller, TextInputType type) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      margin: EdgeInsets.symmetric(vertical: 12),
      width: size.width * 0.9,
      decoration: BoxDecoration(
          color: Color.fromRGBO(217, 217, 217, 1.0),
          borderRadius: BorderRadius.circular(12)),
      child: TextFormField(
        keyboardType: type,
        cursorColor: Colors.black,
        textCapitalization: TextCapitalization.sentences,
        controller: controller,
        decoration: InputDecoration(hintText: hint, border: InputBorder.none),
      ),
      height: 50,
    );
  }
}
