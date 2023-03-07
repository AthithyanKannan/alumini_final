import 'package:flutter/material.dart';

class Tab1 extends StatelessWidget {
  const Tab1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
               children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Batch',
                style: TextStyle(letterSpacing: 1.0, fontSize: 18,fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '2025',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        color: Colors.grey[600]),
                  )
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Branch',
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
                    'ISE',
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
                'Date of Birth',
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
                    '13.04.2004',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        color: Colors.grey[600]),
                  )
                ],
              ),
            ]),
          )
        ],
      ),
    );
  }
}
