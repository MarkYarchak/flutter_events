import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapViewPage extends StatefulWidget {

  @override
  _MapViewPageState createState() => _MapViewPageState();

}

class _MapViewPageState extends State<MapViewPage> {

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(50.75075, 25.331889),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(50.75075, 25.331889),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);


  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  @override
  Widget build(BuildContext context) {
    onMapTap(event) {
      print(event);
    }

    Set<Marker> googleMapMarkers = {
      Marker(
        infoWindow: InfoWindow(
          title: 'Гра у теніс',
          snippet: '50.7395326, 25.32343265'/* (натисніть, щоб відкрити подію)*/,
        ),
        onTap: () {},
        markerId: MarkerId('123'),
        position: LatLng(50.7395326, 25.32343265),
      ),
      Marker(
        markerId: MarkerId('124'),
        position: LatLng(50.7395326, 25.33743265),
      ),
      Marker(
        infoWindow: InfoWindow(
          title: 'Гра у теніс',
          snippet: '50.75220246, 25.33601995'/* (натисніть, щоб відкрити подію)*/,
        ),
        markerId: MarkerId('125'),
        position: LatLng(50.75220246, 25.33601995),
      ),
      Marker(
        markerId: MarkerId('126'),
        position: LatLng(50.74315835, 25.33195439),
      ),
      Marker(
        markerId: MarkerId('127'),
        position: LatLng(50.75711917, 25.32939355),
      ),
      Marker(
        markerId: MarkerId('128'),
        position: LatLng(50.74809541, 25.32701276),
      ),
      Marker(
        markerId: MarkerId('129'),
        position: LatLng(50.74909924, 25.34030981),
      ),
      Marker(
        markerId: MarkerId('130'),
        position: LatLng(50.74597778645547, 25.320142284035683),
      ),
    };

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Title(
          child: Text('Події на карті'),
          color: Colors.white,
        ),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        compassEnabled: true,
        mapToolbarEnabled: false,
        initialCameraPosition: _kGooglePlex,
        markers: googleMapMarkers,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        onTap: onMapTap,
      ),
//      floatingActionButton: FloatingActionButton.extended(
//        onPressed: _goToTheLake,
//        label: Text('To the lake!'),
//        icon: Icon(Icons.directions_boat),
//      ),
    );
  }

}
