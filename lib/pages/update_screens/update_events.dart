import 'dart:io';
import 'package:alumini_final/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class UpdateEvent extends StatefulWidget {
  const UpdateEvent({super.key});

  @override
  State<UpdateEvent> createState() => _UpdateEventState();
}

class _UpdateEventState extends State<UpdateEvent> {
  File? image;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      this.image = imageTemporary;
    } on PlatformException catch (e) {
      print('Failed to pick image');
    }
  }

  TextEditingController EventName = TextEditingController();
  TextEditingController EventDescription = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: BackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
        elevation: 0,
        title: Text(
          'Add Events',
          style: TextStyle(
              color: Colors.white,  letterSpacing: 1),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.done),
            color: Colors.white,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UpdateEventBox('Event Name', EventName),
              // image !=null ? Image.file(image!,
              // height: MediaQuery.of(context).size.height/3.5,
              // width: MediaQuery.of(context).size.width/1.5,
              // fit: BoxFit.cover,
              // ) : 
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () => pickImage(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                        child: Text('Pick Image'),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: primaryColor,
                          textStyle:
                              TextStyle(fontSize: 17),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)))),
                              
                ],
              ),
              Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        margin: EdgeInsets.symmetric(vertical: 12),
        height :size.height/1.7,
        width: size.width * 0.9,
        decoration: BoxDecoration(
            color: Color.fromRGBO(217, 217, 217, 1.0),
            borderRadius: BorderRadius.circular(12)),
        child: TextField(
          textCapitalization: TextCapitalization.words,
          controller: EventDescription,
          maxLines: 200,
          decoration: InputDecoration(
              hintText: 'Event Description',
              border: InputBorder.none),
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
        textCapitalization: TextCapitalization.words,
        controller: controller,
        decoration: InputDecoration(
            hintText: hint,
            border: InputBorder.none),
      ),
      height: 50,
    );
  }
}
