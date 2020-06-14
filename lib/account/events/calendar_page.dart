import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import './events_state.dart';

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

  List<Widget> _buildEventList = [];

  @override
  Widget build(BuildContext context) {

    final Map<DateTime, List<SportEvent>> _calendarEvents = {
//      DateTime(2020, 6, 18): ['Гра у теніс'],
//      DateTime(2020, 6, 19): ['Футбол'],
//      DateTime(2020, 4, 14): ['Волейбол'],
//      DateTime(2020, 4, 21): ['Турніки'],
//      DateTime(2020, 6, 22): ['Шукаю гравця для настільного тенісу', 'Команди для боулінгу'],
    };

    dateOnlyDayLimitation(DateTime date) {
      return DateTime(date.year, date.month, date.day);
    }

    sportEventsList.forEach((SportEvent event) {
      var ref = _calendarEvents[dateOnlyDayLimitation(event.date)];
      _calendarEvents[dateOnlyDayLimitation(event.date)] = [...(ref != null && ref.length != 0 ? ref : []), event];
      return;
    });

    Widget oneEventListItem(SportEvent event) {
      final textDateHours = event.date.hour < 10 ? '0${event.date.hour}' : event.date.hour;
      final textDateMinutes = event.date.minute < 10 ? '0${event.date.minute}' : event.date.minute;
      final textDate = '$textDateHours:$textDateMinutes';

      return Container(
        decoration: BoxDecoration(
          border: Border.all(width: 0.8),
          borderRadius: BorderRadius.circular(12.0),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: ListTile(
          title: Text(event.title),
          leading: Text(textDate),
          onTap: () => print('${event.title} tapped!'),
        ),
      );
    }

    DateTime currentDateSubtractWeek() {
      final date = DateTime.now();
      return DateTime(date.year, date.month, date.day - 7);
    }

    _updateSelectedEventsList(DateTime day, List<dynamic> events) {
      events.sort((a, b) => a.date.millisecondsSinceEpoch.compareTo(b.date.millisecondsSinceEpoch));
      setState(() {
        _buildEventList = events.map((event) => oneEventListItem(event)).toList();
      });
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Title(
          child: Text('Календарні події'),
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: TableCalendar(
                locale: 'uk_UK',
                calendarStyle: CalendarStyle(
                  todayColor: Colors.blue[400],
                  selectedColor: Colors.grey[400], // Colors.yellow[600]
                ),
                startDay: currentDateSubtractWeek(),
                events: _calendarEvents,
                onDaySelected: _updateSelectedEventsList,
                calendarController: this._calendarController,
              ),
            ),
            Container(
              child: Column(
                children: _buildEventList,
              ),
            ),
          ],
        ),
      ),
    );
  }

}
