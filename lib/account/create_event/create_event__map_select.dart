import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EventMapSelect extends StatefulWidget {

  @override
  EventMapSelectState createState() => EventMapSelectState();

}

class EventMapSelectState extends State<EventMapSelect> {

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(50.750750, 25.331889),
    zoom: 14.4746,
  );


  final tapPosition = LatLng(0.325235, 0.235235);

  getPositionValues(position) async {
    final data = await position;
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Title(
          color: Colors.white,
          child: Text('Виберіть розташування'),
        ),
      ),
      body: Container(
        child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          onTap: (data) {
            print(data);
          },
          onMapCreated: (GoogleMapController controller) {
            this.getPositionValues(controller.getVisibleRegion());
            _controller.complete(controller);
          },
        ),
      ),
      bottomNavigationBar: Container(
        height: 90,
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.black),
          ),
        ),
        padding: EdgeInsets.only(top: 3, bottom: 0, left: 3, right: 3),
        child: Column(
          children: <Widget>[
            Text('Луцьк, Україна', textAlign: TextAlign.center,),
            Text('Lat: ${this.tapPosition.latitude.toString()}, Lon: ${this.tapPosition.longitude.toString()}'),
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: Text('Вибрати дану позицію'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

}
