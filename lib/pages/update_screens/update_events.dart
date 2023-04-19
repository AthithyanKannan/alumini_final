import 'dart:io';
import 'package:alumini_final/colors.dart';
import 'package:alumini_final/pages/update_screens/events_notifications.dart';
import 'package:alumini_final/pages/update_screens/get_events.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UpdateEvent extends StatefulWidget {
  const UpdateEvent({super.key});

  @override
  State<UpdateEvent> createState() => _UpdateEventState();
}

class _UpdateEventState extends State<UpdateEvent> {
  // File? image;
  // Future pickImage() async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //     if (image == null) return;
  //     final imageTemporary = File(image.path);
  //     this.image = imageTemporary;
  //   } on PlatformException catch (e) {
  //     print('Failed to pick image');
  //   }
  // }
  TextEditingController EventName = TextEditingController();
  TextEditingController EventDescription = TextEditingController();
  String Eventname = '';
  String Eventdescription = '';
  File? image;
  final _picker = ImagePicker();
  Future<void> _getImage() async {
    final pickedfile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedfile != null) {
      setState(() {
        image = File(pickedfile.path);
      });
    }
  }

  void sendMessage(String title, File? image, String description) async {
    final messagesRef = FirebaseFirestore.instance.collection('events');
    if (image != null) {
      final storageref = FirebaseStorage.instance
          .ref()
          .child('images/${DateTime.now().millisecondsSinceEpoch}');
      await storageref.putFile(image);
      final imageurl = await storageref.getDownloadURL();
      messagesRef.add({
        'title': title,
        'imagesUrl': imageurl,
        'description': description,
        "timestamp": FieldValue.serverTimestamp()
      });
    } else {
      messagesRef.add({
        'title': title,
        "timestamp": FieldValue.serverTimestamp(),
        'description': description,
      });
    }

    setState(() {
      Eventname = '';
      image = null;
      Eventdescription = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: BackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.white,
        ),
        backgroundColor: primaryColor,
        elevation: 0,
        title: const Text(
          'Add Events',
          style: TextStyle(color: Colors.white, letterSpacing: 1),
        ),
        actions: [
          IconButton(
            onPressed: () {
              sendMessage(Eventname, image, Eventdescription);
              Navigator.pop(context);
            },
            icon: const Icon(Icons.done),
            color: Colors.white,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UpdateEventBox('Event Name', EventName),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () => _getImage(),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        child: Text('Pick Image'),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: primaryColor,
                          textStyle: TextStyle(fontSize: 17),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)))),
                ],
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                margin: const EdgeInsets.symmetric(vertical: 12),
                height: size.height / 1.7,
                width: size.width * 0.9,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(217, 217, 217, 1.0),
                    borderRadius: BorderRadius.circular(12)),
                child: TextField(
                  onChanged: (value) {
                    Eventdescription = value;
                  },
                  textCapitalization: TextCapitalization.words,
                  controller: EventDescription,
                  maxLines: 200,
                  decoration: const InputDecoration(
                      hintText: 'Event Description', border: InputBorder.none),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget UpdateEventBox(String hint, TextEditingController controller) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      margin: EdgeInsets.symmetric(vertical: 12),
      width: size.width * 0.9,
      decoration: BoxDecoration(
          color: Color.fromRGBO(217, 217, 217, 1.0),
          borderRadius: BorderRadius.circular(12)),
      child: TextFormField(
        onChanged: (value) {
          setState(() {
            Eventname = value;
          });
        },
        textCapitalization: TextCapitalization.words,
        controller: controller,
        decoration: InputDecoration(hintText: hint, border: InputBorder.none),
      ),
      height: 50,
    );
  }
}
