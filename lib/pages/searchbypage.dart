import 'package:alumini_final/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchByPage extends StatefulWidget {
  const SearchByPage({super.key});

  @override
  State<SearchByPage> createState() => _SearchByPageState();
}

class _SearchByPageState extends State<SearchByPage> {
  List<String> SearchdocIDs = [];
  Future getSearchDocIDs() async {
    await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              SearchdocIDs.add(document.reference.id);
            }));
  }

  List<DocumentSnapshot> searchresults = [];
  TextEditingController searchbyusercontroller = TextEditingController();

  Future<void> searchUsers(String query) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('name', isEqualTo: query)
        .get();
    setState(() {
      searchresults = snapshot.docs;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          margin: const EdgeInsets.symmetric(vertical: 12),
          width: size.width * 0.6,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(217, 217, 217, 1.0),
              borderRadius: BorderRadius.circular(12)),
          height: 45,
          child: TextFormField(
            onChanged: (value) {
              if (searchbyusercontroller.text.isNotEmpty) {
                searchUsers(value);
              }
            },
            keyboardType: TextInputType.name,
            cursorColor: Colors.black,
            textCapitalization: TextCapitalization.sentences,
            controller: searchbyusercontroller,
            decoration: const InputDecoration(
                hintText: "Search", border: InputBorder.none),
          ),
        ),
      ),
      // body: FutureBuilder(
      //   future: searchUsers(),
      //   builder: (context, snapshot) {
      //     return ListView.builder(
      //       padding: const EdgeInsets.symmetric(horizontal: 17),
      //       itemCount: searchresults.length,
      //       itemBuilder: (BuildContext context, int index) {
      //         return GetUser(documentId: SearchdocIDs[index]);
      //       },
      //     );
      //   },
      // ),
        //  body: ListView.builder(
        // padding: const EdgeInsets.symmetric(horizontal: 17),
        // itemCount: searchresults.length,
        // itemBuilder: (BuildContext context, int index) {
        //   final documentData = searchresults[index].data();
        //   return ListTile(
        //     title: Text('${documentData['name']}'),
        //     subtitle: Text(documentData['profession']),
        //     onTap: () {
        //       // Handle item tap
        //       // For example, navigate to the details page for the selected item
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //           builder: (context) => DetailsPage(documentData: documentData),
        //         ),
        //       );
      // body: ListView.builder(
      //   itemCount: searchresults.length,
      //   itemBuilder: (BuildContext context, int index) {
      //         final documentdata = searchresults[index].data();
      //         return ListTile(
      //               //  title:  Text(documentdata['name']),
      //         );
      // },),
    );
  }
}
