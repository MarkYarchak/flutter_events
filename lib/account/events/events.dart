import 'package:flutter/material.dart';

class EventsPage extends StatefulWidget {

  @override
  _EventsPageState createState() => _EventsPageState();
}

class EventLocation {
  num _longitude;
  num _latitude;

  EventLocation(this._longitude, this._latitude);
}

class SportEvent {
  String title;
  String description;
  String type;
  EventLocation location;
  DateTime date;
  int duration;
  int price;
  int membersCount;
  int skillLevel;
  String authorId;
  DateTime createDate;

  SportEvent({
    this.title,
    this.description,
    this.type,
    this.location,
    this.date,
    this.duration,
    this.price,
    this.membersCount,
    this.skillLevel,
    this.authorId,
    this.createDate
  });
}

class _EventsPageState extends State<EventsPage> {

  void createEventHandler() async {
    Navigator.pushNamed(context, '/create-event');
  }

  getDateFullDay(DateTime date) {
    final months = date.month < 10 ? '0${date.month}': date.month;
    final days = date.day < 10 ? '0${date.day}': date.day;
    return int.parse('${date.year}$months$days');
  }
  @override
  Widget build(BuildContext context) {
    final _biggerFont = const TextStyle(fontSize: 16);

    final List eventsListItems = <SportEvent>[
      SportEvent(title: 'Гра у футбол', date: DateTime(2020, 7, 8, 12, 0)),
      SportEvent(title: 'Пробіжка', date: DateTime(2020, 6, 27, 8)),
      SportEvent(title: 'Шукаємо команду для гри у волейбол', date: DateTime(2020, 6, 29, 14)),
      SportEvent(title: 'Гра у теніс', date: DateTime(2020, 6, 29, 12, 30)),
      SportEvent(title: 'Баскетбол', date: DateTime(2020, 6, 30, 16, 15)),
      SportEvent(title: 'Шукаю гравця для настільного теніса', date: DateTime(2020, 6, 21, 13, 30)),
      SportEvent(title: 'Команди для боулінгу', date: DateTime(2020, 6, 21, 10)),
      SportEvent(title: 'Турніки', date: DateTime(2020, 6, 21, 12, 40)),
      SportEvent(title: 'Баскетбол', date: DateTime(2020, 6, 21, 15, 20)),
      SportEvent(title: 'Пробіжка в парку', date: DateTime(2020, 26, 10, 9, 50)),
    ];

    final filteredEventsList = eventsListItems.where((event) => getDateFullDay(event.date/* + DateTime.tryParse(event.duration ?? 0)*/) >= getDateFullDay(DateTime.now())).toList();

    filteredEventsList.sort((a, b) => a.date.millisecondsSinceEpoch.compareTo(b.date.millisecondsSinceEpoch));

    Widget _buildRow(int idx) {
      final oneEvent = filteredEventsList[idx];
      return ListTile(
        title: Text(
          '${oneEvent.title}', //  $idx
          overflow: TextOverflow.ellipsis,
          style: _biggerFont,
        ),
        trailing: Text('${oneEvent.date.hour}:${oneEvent.date.minute < 10 ? '0${oneEvent.date.minute}' : oneEvent.date.minute}'),
        onTap: () {
          Navigator.pushNamed(context, '/event-preview');
        },
      );
    }

    Widget dateDividerBlock(DateTime date) {
      final String blockDate = '${date.day}.${date.month <= 9 ? '0${date.month}' : date.month}.${date.year}';
      return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black54,
            ),
            borderRadius: BorderRadius.all(Radius.circular(8))
          ),
//          margin: EdgeInsets.only(bottom: 10),
          child: Container(
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
              child: Text(blockDate),
            ),
          ),
        ),
      );
    }

    Widget getEventsList() {
      var eventsListIteration = 0;

      return ListView.builder(
        itemCount: filteredEventsList.length * 2,
        padding: const EdgeInsets.only(left: 0, top: 8, bottom: 8, right: 0),
        itemBuilder: (BuildContext context, int i) {
          if (i.isOdd) return Divider();
          final itemRes = _buildRow(eventsListIteration);
          final equalWIthPreviousDay = eventsListIteration != 0
              ? getDateFullDay(filteredEventsList[eventsListIteration].date)
                != getDateFullDay(filteredEventsList[eventsListIteration - 1].date)
              : true;
          if (eventsListIteration == 0 || equalWIthPreviousDay) {
            final resData = Column(
              children: <Widget>[
                dateDividerBlock(filteredEventsList[eventsListIteration].date),
                Divider(),
                itemRes,
              ],
            );
            eventsListIteration++;
            return resData;
          }
          eventsListIteration++;
          return itemRes;
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Title(
          child: Text('CreatePlaySeek'),
          color: Colors.white,
        ),
        actions: <Widget>[
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.account_circle),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          Container(
            width: 20,
          ),
        ],
      ),
      body: getEventsList(),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.blue,
        child: Row(
          children: <Widget>[
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Список подій', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  Container(
                    padding: EdgeInsets.only(right: 90),
                    child: Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: IconButton(
                            icon: Icon(Icons.map),
                            color: Colors.white,
                            onPressed: () {
                              Navigator.pushNamed(context, '/map-view');
                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: IconButton(
                            color: Colors.white,
                            icon: Icon(Icons.calendar_today),
                            onPressed: () {
                              Navigator.pushNamed(context, '/calendar-view');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              padding: EdgeInsets.only(left: 20),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createEventHandler,
        tooltip: 'Додати нову подію',
        child: Icon(Icons.add),
      ), // This trailing comma
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,// makes auto-formatting nicer for build methods.
    );
  }
}
