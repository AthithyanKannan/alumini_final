import 'package:alumini_final/colors.dart';
import 'package:flutter/material.dart';

class EventImage extends StatefulWidget {
  final image;
  final title;
  final eventdescription;
  EventImage(
      {required this.image,
      required this.title,
      required this.eventdescription,
      super.key});

  @override
  State<EventImage> createState() => _EventImageState();
}

class _EventImageState extends State<EventImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          iconSize: 20,
          icon: const Icon(Icons.arrow_back),
        ),
        title: RichText(
          text: const TextSpan(
              text: 'Event ',
              style: TextStyle(fontSize: 20),
              children: [
                TextSpan(
                    text: 'Details',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600))
              ]),
        ),
      ),
      body: Column(children: [
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Color.fromRGBO(245, 245, 245, 1),
          ),
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Event Name",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.blueGrey,
                    fontSize: 13),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                widget.title,
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          height: 150.0,
          width: 170.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(widget.image),
              fit: BoxFit.fill,
            ),
            shape: BoxShape.rectangle,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Color.fromRGBO(245, 245, 245, 1),
          ),
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Event Description",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.blueGrey,
                    fontSize: 13),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                widget.eventdescription,
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
