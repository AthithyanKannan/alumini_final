import 'package:alumini_final/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

String documentId = '';

setDocumentId(String id) {
  documentId = id;
}

class EditPersonalTab extends StatefulWidget {
  String name2;
  String batch2;
  String branch2;
  String dob2;

  EditPersonalTab(
      {required this.name2,
      required this.batch2,
      required this.branch2,
      required this.dob2,
      super.key});
  @override
  State<EditPersonalTab> createState() => _EditPersonalTabState();
}

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
final User? user = _firebaseAuth.currentUser;

void getDocumentIdByCondition() async {
  final QuerySnapshot querySnapshot = await _firestore
      .collection('users')
      .where('email', isEqualTo: user!.email)
      .get();

  final DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
  String documentId = documentSnapshot.id;
  setDocumentId(documentId);
}

void updateCurrentUserPersonal(
    String name, String batch, String branch, String dob) {
  _firestore
      .collection('users')
      .doc(documentId)
      .update({'name': name, 'batch': batch, 'branch': branch, 'dob': dob});
}

class _EditPersonalTabState extends State<EditPersonalTab> {
  @override
  void initState() {
    getDocumentIdByCondition();
    super.initState();
  }

  Widget build(BuildContext context) {
    final TextEditingController EditnameController =
        TextEditingController(text: widget.name2);
    final TextEditingController EditBatchController =
        TextEditingController(text: widget.batch2);
    final TextEditingController EditBranchController =
        TextEditingController(text: widget.branch2);
    final TextEditingController EditDobController =
        TextEditingController(text: widget.dob2);
    return Scaffold(
        body: Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        EditTextBox('Name', EditnameController, TextInputType.name),
        EditTextBox('Batch', EditBatchController, TextInputType.number),
        EditTextBox('Branch', EditBranchController, TextInputType.name),
        EditTextBox('DOB', EditDobController, TextInputType.datetime),
        const SizedBox(
          height: 50,
        ),
        ElevatedButton(
            onPressed: () {
              updateCurrentUserPersonal(
                  EditnameController.text.trim(),
                  EditBatchController.text.trim(),
                  EditBranchController.text.trim(),
                  EditDobController.text.trim());
              Navigator.pop(context);
            },
            child: const Text('Save Changes'),
            style: ButtonStyle(
                textStyle:
                    MaterialStateProperty.all(const TextStyle(fontSize: 15)),
                backgroundColor: MaterialStateProperty.all(primaryColor),
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 15)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)))))
      ],
    ));
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

  // Future<DocumentSnapshot?> fetchUserFields() async {
  //   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  //   final User? user = _firebaseAuth.currentUser;

  //   if (user != null) {
  //     final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  //     QuerySnapshot currentuserSnapshot = await _firebaseFirestore
  //         .collection('users')
  //         .where('email', isEqualTo: user.email)
  //         .get();
  //     if (currentuserSnapshot.docs.isNotEmpty) {
  //       return currentuserSnapshot.docs.first;
  //     } else {
  //       return null;
  //     }
  //   }
  // }
}
