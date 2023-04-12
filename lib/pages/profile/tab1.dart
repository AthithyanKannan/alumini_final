import 'package:alumini_final/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'profilepage.dart';

class Tab1 extends StatefulWidget {
  final QueryDocumentSnapshot TabBar1Data;
  Tab1({key, required this.TabBar1Data}) : super(key: key);

  @override
  State<Tab1> createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColor,
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              if ('${widget.TabBar1Data['1']}' == '1')
                CurrentUserTabView1()
              else if ('${widget.TabBar1Data['2']}' == '2')
                CurrentUserTabView1()
              else if ('${widget.TabBar1Data['3']}' == '3')
                CurrentUserTabView1()
              else if (widget.TabBar1Data['4'] == '4')
                CurrentUserTabView1()
              else if (widget.TabBar1Data['5'] == '5')
                CurrentUserTabView1()
              else if (widget.TabBar1Data['6'] == '6')
                CurrentUserTabView1()
              else if (widget.TabBar1Data['7'] == '7')
                CurrentUserTabView1()
              else if (widget.TabBar1Data['8'] == '8')
                CurrentUserTabView1()
              else
                CurrentUserTabView1()
            ],
          )
          // ]),
          ),
    );
  }

  Widget CurrentUserTabView1() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Color.fromRGBO(245, 245, 245, 1),
          ),
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Branch",
                style: TextStyle(
                    // letterSpacing: 1.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.blueGrey,
                    fontSize: 13),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                '${widget.TabBar1Data['branch']}',
                style: const TextStyle(
                    // letterSpacing: 1.0,
                    fontWeight: FontWeight.w600,
                    fontSize: 15),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Color.fromRGBO(245, 245, 245, 1),
          ),
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Batch",
                style: TextStyle(
                    // letterSpacing: 1.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.blueGrey,
                    fontSize: 13),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                '${widget.TabBar1Data['batch']}',
                style: const TextStyle(
                    // letterSpacing: 1.0,
                    fontWeight: FontWeight.w600,
                    fontSize: 15),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Color.fromRGBO(245, 245, 245, 1),
          ),
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Date Of birth",
                style: TextStyle(
                    // letterSpacing: 1.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.blueGrey,
                    fontSize: 13),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                '${widget.TabBar1Data['dob']}',
                style: TextStyle(
                    // letterSpacing: 1.0,
                    fontWeight: FontWeight.w600,
                    fontSize: 15),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
