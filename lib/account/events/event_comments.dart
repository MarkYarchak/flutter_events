import 'package:flutter/material.dart';

class EventComments extends StatefulWidget {

  @override
  EventCommentsState createState() => EventCommentsState();

}

class EventCommentsState extends State<EventComments> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(
          color: Colors.blue,
          child: Text(''),
        ),
      ),
    );
  }

}
