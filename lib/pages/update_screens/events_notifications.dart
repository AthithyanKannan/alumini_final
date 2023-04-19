import 'package:alumini_final/colors.dart';
import 'package:alumini_final/pages/update_screens/get_events.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EventNotification extends StatefulWidget {
  // final String eventsDocId;

  // const EventNotification({required this.eventsDocId, super.key})
  // ;
  EventNotification({super.key});

  @override
  State<EventNotification> createState() => _EventNotificationState();
}

class _EventNotificationState extends State<EventNotification> {
  List<String> eventDocIds = [];

  Future getEventDocIDS() async {
    await FirebaseFirestore.instance
        .collection('events')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              eventDocIds.add(document.reference.id);
            }));
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference events =
        FirebaseFirestore.instance.collection('events');
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
          'Notification',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600
            ),
        ),
      ),
      body: Column(children: [
        Expanded(
            child: FutureBuilder(
          future: getEventDocIDS(),
          builder: (context, snapshot) {
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              itemCount: eventDocIds.length,
              itemBuilder: (BuildContext context, int index) {
                return GetEvents(
                  eventDocumentID: eventDocIds[index],
                );
              },
            );
          },
        )),
      ]),
    );

    // body: FutureBuilder<DocumentSnapshot>(
    //   future: events.doc(widget.eventsDocId).get(),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.done) {
    //       Map<String, dynamic> eventdata =
    //           snapshot.data!.data() as Map<String, dynamic>;
    //       final imageurl = eventdata['imageUrl'];
    //       final title = eventdata['text'];
    //       final timestamp = eventdata['timestamp'] as Timestamp;
    //       return ListTile(
    //         title: title,
    //         leading:
    //             imageurl != null ? Image.network(imageurl) : Text("Null"),
    //         subtitle: Text(timestamp.toDate().toString()),
    //       );
    //     }

    //     return Text("Loading");
    //   },
    // ),
    // body: StreamBuilder<QuerySnapshot>(
    //   stream: FirebaseFirestore.instance
    //       .collection('events')
    //       .orderBy('timestamp', descending: true)
    //       .snapshots(),
    //   builder: (context, snapshot) {
    //     Map<String, dynamic> data = snapshot.data! as Map<String, dynamic>;
    //     final imageUrl = data['imagesUrl'];
    //     final title = data['text'];
    //     final timestamp = data['timestamp'] as Timestamp;
    //     if (snapshot.connectionState == ConnectionState.done) {
    //       return ListTile(
    //         leading: imageUrl != null ? Image.network(imageUrl) : null,
    //         title: Text(title),
    //         subtitle: Text(timestamp.toDate().toString()),
    //       );
    //     }
    //     return ListTile(
    //       leading: imageUrl != null ? Image.network(imageUrl) : null,
    //       title: Text(title),
    //       subtitle: Text(timestamp.toDate().toString()),
    //     );
    //   },
    // ));

    //   body: Center(
    //       child: FutureBuilder<QuerySnapshot>(
    //     future: FirebaseFirestore.instance
    //         .collection('events') // 👈 Your collection name here
    //         .get(),
    //     builder: (context, snapshot) {
    //       if (snapshot.hasError) return Text('Error = ${snapshot.error}');
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return const Text("Loading");
    //       }
    //       return ListView(
    //           children: snapshot.data!.docs.map((DocumentSnapshot document) {
    //         Map<String, dynamic> data =
    //             document.data()! as Map<String, dynamic>;
    //         return ListTile(
    //           // leading: Text(data['timestamp']),
    //           title: Text(data['text']), // 👈 Your valid data here
    //         );
    //       }).toList());
    //     },
    //   )),
    // );
  }
}
