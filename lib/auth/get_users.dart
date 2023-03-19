import 'package:alumini_final/pages/profile/alumini_profile.dart';
import 'package:alumini_final/pages/update_screens/update_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class GetUser extends StatelessWidget {
  final String documentId;

  GetUser({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AluminiProfile(),
                  ));
            },
            
            child: Card(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 10),
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 25,
                    backgroundImage: AssetImage('assets/profile icon.png'),
                  ),
                  SizedBox(width: 20),
                  if(industry==1)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${data['name']}',
                        style: TextStyle(fontFamily: 'Roboto', fontSize: 18),
                      ),
                      Text(
                        '${data['batch']}',
                        style: TextStyle(fontFamily: 'Roboto', fontSize: 14),
                      )
                    ],
                  )
                ],
              ),
            )),
          );
        }
        return Shimmer.fromColors(
          direction: ShimmerDirection.ltr,
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.white,
          child: Card(
            child: Container(
              height: 60,
            ),
          ),
        );
      },
    );
  }
}
