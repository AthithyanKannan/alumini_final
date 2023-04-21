import 'package:alumini_final/pages/update_screens/get_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GetEvents extends StatefulWidget {
  final String eventDocumentID;
  const GetEvents({required this.eventDocumentID, super.key});

  @override
  State<GetEvents> createState() => _GetEventsState();
}

class _GetEventsState extends State<GetEvents> {
  @override
  Widget build(BuildContext context) {
    String email = '';
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    if (user != null) {
      email = user.email!;
    } else {
    }
    CollectionReference eventCollectionRef =
        FirebaseFirestore.instance.collection('events');
    return FutureBuilder<DocumentSnapshot>(
      future: eventCollectionRef.doc(widget.eventDocumentID).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> eventdata =
              snapshot.data!.data() as Map<String, dynamic>;
          final text = eventdata['title'];
          final imageurl = eventdata['imagesUrl'];
          final description = eventdata['description'];
          final timestamp = eventdata['timestamp'] as Timestamp;
          if ('${eventdata['email']}' == email)
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EventImage(
                          image: imageurl,
                          title: text,
                          eventdescription: description),
                    ));
              },
              child: Card(
                  child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text("${eventdata['title']}"),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(timestamp.toDate().toString()),
                    IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                  ],
                ),
              )),
            );
          else {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EventImage(
                          image: imageurl,
                          title: text,
                          eventdescription: description),
                    ));
              },
              child: Card(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text("${eventdata['title']}"),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(timestamp.toDate().toString()),
                  ],
                ),
              )),
            );
          }
        }

        return const Text("Loading");
      },
    );
  }
}
