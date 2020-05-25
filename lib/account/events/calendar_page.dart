import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarViewPage extends StatefulWidget {

  @override
  CalendarViewState createState() => CalendarViewState();

}

class CalendarViewState extends State<CalendarViewPage> {

  var _calendarController = CalendarController();

  @override
  void dispose() {
    this._calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Title(
          child: Text('Календарні події'),
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: TableCalendar(
            locale: 'uk_UK',
            holidays: {
              DateTime(2020, 5, 1): ['New Year\'s Day'],
              DateTime(2020, 4, 6): ['Epiphany'],
              DateTime(2020, 4, 14): ['Valentine\'s Day'],
              DateTime(2020, 4, 21): ['Easter Sunday'],
              DateTime(2020, 4, 22): ['Easter Monday'],
            },
            calendarController: this._calendarController,
          ),
        ),
      ),
    );
  }

}
