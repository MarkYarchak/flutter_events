import 'package:flutter/material.dart';

class EventsPage extends StatefulWidget {

  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {

  void createEventHandler() async {
    Navigator.pushNamed(context, '/create-event');
  }


  @override
  Widget build(BuildContext context) {
    final numItems = 20;
    final _biggerFont = const TextStyle(fontSize: 16);

    Widget _buildRow(int idx) {
      return ListTile(
//        leading: CircleAvatar(
//          backgroundColor: Colors.transparent,
//          backgroundImage: NetworkImage('https://www.gettyimages.com/gi-resources/images/500px/983794168.jpg'),
//        ),
        title: Text(
          'Item $idx',
          overflow: TextOverflow.ellipsis,
          style: _biggerFont,
        ),
        trailing: Text('20:00'),
        onTap: () {
          Navigator.pushNamed(context, '/event-preview');
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
      body: ListView.builder(
        itemCount: numItems * 2,
        padding: const EdgeInsets.only(left: 0, top: 8, bottom: 8, right: 0),
        itemBuilder: (BuildContext context, int i) {
          if (i.isOdd) return Divider();
          final index = i ~/ 2 + 1;
          return _buildRow(index);
        },
      ),
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
