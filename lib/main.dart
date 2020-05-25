import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'dart:async';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'login/login_layout.dart';
import 'account/events/events.dart';
import 'account/events/mapview_page.dart';
import 'account/events/calendar_page.dart';
import 'account/events/event_preview.dart';
import 'account/create_event/create_event.dart';
import 'account/create_event/create_event__map_select.dart';
import 'account/events/event_comments.dart';
import 'account/profile/profile_page.dart';
import 'account/profile/account_profile_settings.dart';


FlutterSecureStorage storage = FlutterSecureStorage();

Future<Widget> getDefaultWidget() async {
  try {
    String loginUser = await storage.read(key: "auth_token");
    if (loginUser is String && loginUser.length != 0) return EventsPage();
    return LoginPage();
  } catch (e) {
    return LoginPage();
  }
}

//final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
void main() async {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  var defaultWidget = await getDefaultWidget();

  initializeDateFormatting().then((_) {
    runApp(MaterialApp(
//      title: 'CreatePlaySeek',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: defaultWidget,
//      navigatorObservers: [routeObserver],
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => new LoginPage(),
        '/events': (BuildContext context) => new EventsPage(),
        '/create-event': (BuildContext context) => new CreateEvent(),
        '/event-map-select': (BuildContext context) => new EventMapSelect(),
        '/event-preview': (BuildContext context) => new EventPreview(),
        '/event-comments': (BuildContext context) => new EventComments(),
        '/calendar-view': (BuildContext context) => new CalendarViewPage(),
        '/map-view': (BuildContext context) => new MapViewPage(),
        '/profile': (BuildContext context) => new ProfilePage(),
        '/profile-settings': (BuildContext context) => new ProfileSettings(),
      },
    ));
  });
}
