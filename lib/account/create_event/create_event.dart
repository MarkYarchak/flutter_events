import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../sport_types.dart';

class CreateEvent extends StatefulWidget {

  @override
  CreateEventState createState() => CreateEventState();

}

class EventForm {
  String title, description;
  int type;
  LatLng location;
  DateTime date;
  int duration;
  int price;
  int membersCount;
  int skillLevel;

  EventForm({
    this.title,
    this.description,
    this.type,
    this.location,
    this.date,
    this.duration,
    this.price,
    this.membersCount,
    this.skillLevel
  });
}

class CreateEventState extends State<CreateEvent> {

  int _currentStep = 0;

  final newEventForm = EventForm(title: '', skillLevel: 0);

  eventPreviewHandler() {}

  Widget _getSportTypes() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: sportTypes.map((sportType) => GestureDetector(
        onTap: () {
          setState(() {
            newEventForm.title = sportType.title;
          });
        },
        child: Container(
          width: 160.0,
          padding: EdgeInsets.only(top: 1, bottom: 1, left: 3, right: 3),
          margin: EdgeInsets.only(left: 5, right: 5),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: newEventForm.title == sportType.title ? 3 : 1)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Text(sportType.title, style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Image(image: AssetImage(sportType.imagePath), width: 80),
            ],
          ),
        ),
      )).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Title(
          child: Text('Створити подію'),
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stepper(
              controlsBuilder: (BuildContext context, {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
                return Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 20, right: 7),
                      child: RaisedButton(
                        child: Text(_currentStep == 5 ? 'СТВОРИТИ' : 'Далі'),
                        color: Colors.blue,
                        textColor: Colors.white,
                        onPressed: onStepContinue,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20, left: 7),
                      child: _currentStep == 0 ? null : FlatButton(
                        child: const Text('Назад'),
                        onPressed: onStepCancel,
                      ),
                    ),
                  ],
                );
              },
              physics: ClampingScrollPhysics(),
//            type: StepperType.horizontal,
              currentStep: _currentStep,
              onStepContinue: () {
                if (_currentStep >= 5) return;
                setState(() {
                  _currentStep += 1;
                });
              },
              onStepCancel: () {
                if (_currentStep <= 0) return;
                setState(() {
                  _currentStep -= 1;
                });
              },
              steps: [
                Step(
                  title: Text('Назва та опис'),
                  content: Container(
                    padding: EdgeInsets.only(top: 8),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          decoration: InputDecoration(
                              hintText: 'Назва події',
                              border: OutlineInputBorder()
                          ),
                          maxLength: 30,
                        ),
                        TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 3,
                          maxLength: 120,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Додайте опис',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: Text('Вид події'),
                  content: Container(
//                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 200.0,
                    padding: EdgeInsets.only(top: 8),
                    child: _getSportTypes(),
                  ),
                ),
                Step(
                  title: Text('Розташування'),
                  content: Container(
                    padding: EdgeInsets.only(top: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(7),
                          width: double.infinity,
//                            RaisedButton
                          child: OutlineButton(
                            color: Colors.blue,
                            textColor: Colors.blue,
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
//                            textColor: Colors.white,
                            child: Text('Знайти на карті'),
                            onPressed: () {
                              Navigator.pushNamed(context, '/event-map-select');
                            },
                          ),
                        ),
//                        Container(
//                          padding: EdgeInsets.only(top: 7),
//                          width: double.infinity,
//                          child: OutlineButton(
//                            textColor: Colors.blue,
//                            borderSide: BorderSide(
//                              color: Colors.blue,
//                            ),
//                            shape: RoundedRectangleBorder(
//                              borderRadius: BorderRadius.circular(18.0),
//                              side: BorderSide(color: Colors.blue),
//                            ),
//                            child: Text('Встановити поточне місцезнаходження', textAlign: TextAlign.center,),
//                            onPressed: () {},
//                          ),
//                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: Text('Дані про час проведення'),
                  content: Container(
                    padding: EdgeInsets.only(top: 8),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width * 0.38,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Дата',
                                  border: OutlineInputBorder(),
                                  helperText: '',
                                ),
                                onTap: () {},
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.38,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Час',
                                  border: OutlineInputBorder(),
                                  helperText: '',
                                ),
                                onTap: () {},
                              ),
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                        TextField(
                          decoration: InputDecoration(
                              hintText: 'Тривалість',
                              border: OutlineInputBorder()
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: Text('Обмеження'),
                  content: Container(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Загальна вартість',
                            border: OutlineInputBorder(),
                            suffix: Text('грн'),
                            helperText: '',
                          ),
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Максимальна к-сть учасників',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 25),
                          child: Column(
                            children: <Widget>[
                              Text('Необхідний рівень гри учасників'),
                              Slider(
                                value: newEventForm.skillLevel.toDouble(),
                                label: '${newEventForm.skillLevel == 1 ? 'Аматор' : newEventForm.skillLevel == 2 ? 'Профі' : 'Новачок'}',
                                min: 0,
                                max: 2,
                                divisions: 2,
                                onChanged: (val) {
                                  setState(() {
                                    newEventForm.skillLevel = val.round();
                                  });
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: Text('Перегляд та створення'),
                  content: Container(
                    width: double.infinity,
                    child: OutlineButton(
                      borderSide: BorderSide(
                          color: Colors.blue
                      ),
                      textColor: Colors.blue,
                      child: Text('Попередній перегляд'),
                      onPressed: eventPreviewHandler,
                    ),
                  ),
                ),
              ],
            ),
            Text(''),
          ],
        ),
      ),
    );
  }

}
