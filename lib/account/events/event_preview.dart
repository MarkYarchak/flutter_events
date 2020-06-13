import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EventPreview extends StatefulWidget {


  @override
  EventPreviewState createState() => EventPreviewState();

}

class PhantomUser {
  String avatarUrl = 'https://images.pexels.com/photos/3563888/pexels-photo-3563888.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';
  String username = 'markyarchak';
}

class EventData {
  final String title;
  final String description;
  final String type;
  final LatLng location;
  final DateTime date;
  final int duration;
  final int price;
  final int membersCount;
  final int skillLevel;
  final String authorId;
  final DateTime createDate;
  final List responseList;

  EventData(
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
    this.createDate,
    this.responseList,
    );
}

class EventPreviewState extends State<EventPreview> {

  final eventMembers = List.from([
    new PhantomUser(),
    new PhantomUser(),
  ]);

  addUserToMember() {
    setState(() {

    });
  }

  goToCommentsHandler() {
    Navigator.pushNamed(context, '/event-comments');
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Title(
            child: Text('Деталі події'),
            color: Colors.white,
          ),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.assignment), text: 'Опис'),
              Tab(icon: Icon(Icons.people), text: 'Учасники'),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Container(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 5, right: 5),
                      child: Text('Гра у волейбол', style: TextStyle(fontSize: 22)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 5, right: 5),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text('Опис', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 5, right: 5, top: 10),
                              child: Container(
                                padding: EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                  border: Border(
                                    left: BorderSide(
                                      color: Colors.black,
                                      width: 2,
                                    ),
                                  ),
                                ),
                                child: Text('Супер класна гра у волейбол, приходьте! Всім раді'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 30, left: 7, right: 7),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFBBDEFB),
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.black,
                            )
                          )
                        ),
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: <Widget>[
                            Text('Вид події: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            Text('Волейбол', style: TextStyle(fontSize: 16)),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(top: 15, left: 10, right: 10),
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.all(7),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 5, right: 5, top: 3, bottom: 7),
                                child: Text('Час проведення', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: Row(
                                  children: <Widget>[
                                    Text('Дата: ', style: TextStyle(fontSize: 15)),
                                    Text('8 квітня 2020 року', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15))
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: Row(
                                  children: <Widget>[
                                    Text('Точний час: ', style: TextStyle(fontSize: 15)),
                                    Text('20:43', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15))
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: Row(
                                  children: <Widget>[
                                    Text('Тривалість: ', style: TextStyle(fontSize: 15)),
                                    Text('20 хвилин', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(7),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 5, right: 5, top: 3, bottom: 7),
                                child: Text('Розташування', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                              ),
                              Text('Довгота: 50.4851493'),
                              Text('Широта: 30.4721233'),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.only(top: 10, left: 5, right: 5),
                                child: OutlineButton(
                                  child: Text('Показати на карті'),
                                  textColor: Colors.blue,
                                  borderSide: BorderSide(color: Colors.blue),
                                  color: Colors.blue,
                                  onPressed: () {},
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 15, left: 10, right: 10),
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: EdgeInsets.all(7),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 5, right: 5, top: 3, bottom: 7),
                              child: Text('Обмеження', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Row(
                                children: <Widget>[
                                  Text('Вартість: ', style: TextStyle(fontSize: 15)),
                                  Text('20 грн', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15))
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Row(
                                children: <Widget>[
                                  Text('Максимальна к-сть учасників: ', style: TextStyle(fontSize: 15)),
                                  Text('80', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15))
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Row(
                                children: <Widget>[
                                  Text('Мінімальний рівень гри: ', style: TextStyle(fontSize: 15)),
                                  Text('новачок'/* аматор профі */, style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(7),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 5, right: 5, top: 3, bottom: 7),
                                child: Text('Організатор', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.only(bottom: 4, top: 4, left: 16, right: 16),
                                leading: Image.network("https://image.flaticon.com/icons/png/512/2922/2922532.png"),
                                title: Text("Влад Войтович", style: TextStyle(fontSize: 16)),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.only(top: 10, left: 5, right: 5),
                                child: OutlineButton(
                                  child: Text('Переглянути профіль'),
                                  textColor: Colors.blue,
                                  borderSide: BorderSide(color: Colors.blue),
                                  color: Colors.blue,
                                  onPressed: () {},
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: Container(
                          padding: EdgeInsets.only(left: 10, right: 10, top: 6, bottom: 6),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue
                            )
                          ),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(8),
                                child: Text(true ? 'Натисніть для скасування участі' : 'Натисніть, щоб стати учасником'),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: RaisedButton(
                                  color: true ? Colors.black38 : Colors.blue,
                                  textColor: true ? Colors.white70 : Colors.white,
                                  child: Text(true ? 'Не брати участі' : 'Приєднатись'),
                                  onPressed: addUserToMember,
                                ),
                              ),
                            ],
                          )
                        ),
                      ),
                    ),
                    Column(
//                  children: eventMembers.map((member) => ListTile(
//                    contentPadding: EdgeInsets.only(bottom: 4, top: 4, left: 16, right: 16),
//                    leading: Image(image: AssetImage(member.avatarUrl), width: 45),
//                    title: Text(member.username, style: TextStyle(fontSize: 16)),
//                  )).toList(),
                    ),
                  ],
                )
              ),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(top: 0, bottom: 4, right: 12, left: 12),
          child: RaisedButton(
            color: Colors.blue,
            textColor: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(Icons.chat),
                ),
                Text('Перейти до чату')
              ],
            ),
            onPressed: goToCommentsHandler,
          ),
        ),
      ),
    );
  }

}
