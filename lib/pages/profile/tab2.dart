import 'package:flutter/material.dart';

class Tab2 extends StatelessWidget {
  const Tab2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Designation',
              style: TextStyle(fontFamily: 'Roboto', fontSize: 18),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'App Developer',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16,
                      color: Colors.grey[600]),
                )
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Industry Name',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Roboto',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'TCS',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16,
                      color: Colors.grey[600]),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Location',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Roboto',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Chennai',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16,
                      color: Colors.grey[600]),
                )
              ],
            ),
          ]),
        )
      ]),
    );
  }
}
