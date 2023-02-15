import 'package:alumini_final/colors.dart';
import 'package:alumini_final/pages/profile/profilepage.dart';
import 'package:alumini_final/pages/searchpage.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List pages = [SearchPage(), MyProfile()];
  int currentindex = 0;
  void Ontap(int index) {
    setState(() {
      currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColor,
      body: pages[currentindex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: Ontap,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentindex,
        elevation: 0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'My Profile'),
        ],
      ),
    );
  }
}