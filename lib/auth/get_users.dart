import 'package:alumini_final/pages/profile/alumini_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../increment.dart';

class GetUser extends StatefulWidget {
  final String documentId;
  int FinalIndustry = 0;
  int FinalStudies = 0;

  GetUser({required this.documentId});

  @override
  State<GetUser> createState() => _GetUserState();
}

class _GetUserState extends State<GetUser> {
  @override
  void initState() {
    final int FinalIndustry = industry;
    final int FinalStudies = higherstudies;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(widget.documentId).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AluminiProfile(data1: data),
                  ));
            },
            child: Card(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 10),
                  const CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 25,
                    backgroundImage: AssetImage('assets/profile icon.png'),
                  ),
                  const SizedBox(width: 20),
                  // if (widget.FinalIndustry == 1)
                  //   DisplayUser('${data['name']}', '${data['designation']}'),
                  // if (widget.FinalStudies == 1)
                  //   DisplayUser('${data['name']}', '${data['degree']}'),
                  // if (finalEntreprenuer == 1)
                  // DisplayUser('${data['name']}', '${data['about business']}'),
                  // if (competitive_exam == 1)
                  //   DisplayUser('${data['name']}', '${data['location']}'),
                  // if (trainers == 1)
                  //   DisplayUser('${data['name']}', '${data['trainig role']}'),
                  // if (bank == 1)
                  //   DisplayUser('${data['name']}', '${data['designation']}'),
                  // if (searchjob == 1)
                  //   DisplayUser('${data['name']}',
                  //       'Searching For.${data['searching for']}'),
                  // if (govtjob == 1)
                  //   DisplayUser('${data['name']}', '${data['designation']}'),
                  // if (other == 1)
                  //   DisplayUser('${data['name']}', '${data['other']}'),
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

  Widget DisplayUser(
    String name,
    String accoringtouser,
  ) {
    return GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(fontFamily: 'Roboto', fontSize: 18),
          ),
          Text(
            accoringtouser,
            style: TextStyle(fontFamily: 'Roboto', fontSize: 14),
          ),
        ],
      ),
    );
  }
}
