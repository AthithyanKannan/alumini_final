import 'package:alumini_final/pages/update_screens/get_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

String DeletedocumentId = '';

setEventDocumentId(String id) {
  DeletedocumentId = id;
}

class GetEvents extends StatefulWidget {
  final String eventDocumentID;
  const GetEvents({required this.eventDocumentID, super.key});

  @override
  State<GetEvents> createState() => _GetEventsState();
}

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
final User? user = _firebaseAuth.currentUser;


void getEventDocumentIdByCondition() async {
  final QuerySnapshot querySnapshot = await _firestore
      .collection('events')
      .where('email', isEqualTo: user!.email)
      .get();


  try{
    if (querySnapshot != null) {
    final DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
    String DeletedocumentId = documentSnapshot.id;
    setEventDocumentId(DeletedocumentId);
  } else {
    null;
  }
  }on StateError catch(e){
    return null;
  }

}


void DeleteEvent(String id) {
  _firestore.collection("events").doc(DeletedocumentId).delete();
}

class _GetEventsState extends State<GetEvents> {
  void initState() {
    getEventDocumentIdByCondition();
    super.initState();
  }

  @override
  void dispose() {
    getEventDocumentIdByCondition();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String email = '';
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    if (user != null) {
      email = user.email!;
    } else {}
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
          final timestamp = eventdata['timestamp'] as Timestamp?;
          final datestring = timestamp!.toDate().toString();
          if ('${eventdata['email']}' == email) {
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              "Name:",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 17),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "${eventdata['title']}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 17),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Text(
                              "Time:",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 17),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              timestamp.toDate().toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 17),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              DeleteEvent(DeletedocumentId);
                            },
                            icon: Icon(Icons.delete))
                      ],
                    )
                  ],
                ),
              )),
            );
          } else {
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Name:",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 17),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "${eventdata['title']}",
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 17),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Time:",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 17),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                         datestring,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 17),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
            );
          }
        }

        return const Center(
            child:  Text(
          "No more events",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ));
      },
    );
  }
}
