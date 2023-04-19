import 'package:alumini_final/pages/update_screens/get_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
                  Text(timestamp.toDate().toString())
                ],
              ),
            )),
            // child: Card(
            //   child: Column(
            //     children: [
            //       // Container(
            //       //   height: 150.0,
            //       //   width: 170.0,
            //       //   decoration: BoxDecoration(
            //       //     image: DecorationImage(
            //       //       image: NetworkImage(imageurl),
            //       //       fit: BoxFit.fill,
            //       //     ),
            //       //     shape: BoxShape.rectangle,
            //       //   ),
            //       // ),
            //       Text("${eventdata['title']}"),
            //       Text(timestamp.toDate().toString())
            //     ],
            //   ),
            // ),
          );
        }
        return const Text("Loading");
      },
    );
  }
}
