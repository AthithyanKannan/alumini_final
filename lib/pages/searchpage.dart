import 'package:alumini_final/colors.dart';
import 'package:alumini_final/pages/profile/alumini_profile.dart';
import 'package:alumini_final/pages/update_screens/events_notifications.dart';
import 'package:alumini_final/pages/update_screens/update_events.dart';
import 'package:alumini_final/pages/update_screens/update_profile.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: BackgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
       title: RichText(
          text:
              TextSpan(text: 'Alumini ', style: TextStyle(fontSize: 20), children: [
            TextSpan(
                text: 'Connect',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600))
          ]),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UpdateEvent(),
                    ));
              },
              icon: Icon(
                Icons.add,
                color: Colors.white,
              )),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => EventNotification())));
            },
            icon: Icon(Icons.notifications),
            color: Colors.white,
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 1),
                  margin: EdgeInsets.symmetric(vertical: 12),
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(217, 217, 217, 1.0),
                      borderRadius: BorderRadius.circular(8)),
                  child: TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        prefixIconColor: Colors.black,
                        hintText: 'Eg:Name',
                        hintStyle: TextStyle(fontFamily: 'Roboto'),
                        border: InputBorder.none),
                  ),
                  height: 50,
                ),
                CardFormat('Athithyan K', 'BE Student',
                    AssetImage('assets/profile icon.png')),
                CardFormat('Jashwanth R', 'CTS Developer',
                    AssetImage('assets/profile icon.png')),
                CardFormat('Thiru S', 'UI/UX Designer',
                    AssetImage('assets/profile icon.png')),
                CardFormat('Rishwanth Rajaa NL', 'Mobile App Developer',
                    AssetImage('assets/profile icon.png')),
                CardFormat('Surya R', 'Data Scientist',
                    AssetImage('assets/profile icon.png')),
                CardFormat('Subash S', 'Game Developer',
                    AssetImage('assets/profile icon.png')),
                CardFormat('Yuvarajan N', 'Data Scientist',
                    AssetImage('assets/profile icon.png')),
                CardFormat('Yogeshwaran S', 'Code Debugger',
                    AssetImage('assets/profile icon.png')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget CardFormat(String name, String profession, AssetImage assetImage) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AluminiProfile(),
            ));
      },
      onLongPress: () => Colors.grey,
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
                backgroundImage: assetImage),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontFamily: 'Roboto', fontSize: 18),
                ),
                Text(
                  profession,
                  style: TextStyle(fontFamily: 'Roboto', fontSize: 14),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
