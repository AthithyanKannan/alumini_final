import 'package:alumini_final/colors.dart';
import 'package:flutter/material.dart';

class EventNotification extends StatefulWidget {
  const EventNotification({super.key});

  @override
  State<EventNotification> createState() => _EventNotificationState();
}

class _EventNotificationState extends State<EventNotification> {
  @override
  Widget build(BuildContext context) {
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
          'Notification',
          style: TextStyle(
              color: Colors.white, letterSpacing: 1),
        ),
      ),
      body: Center(child: Text(
        'No More Events',
        style: TextStyle(
          fontSize: 20,
        ),
      )),
    );
  }
}