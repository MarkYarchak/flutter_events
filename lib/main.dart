import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
//import 'package:bloc/bloc.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'dart:async';
//import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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


//FlutterSecureStorage storage = FlutterSecureStorage();

Future<Widget> getDefaultWidget() async {
  try {
    print('token: token11');
    var dir = await getApplicationDocumentsDirectory();
    print('token: token12');
    await dir.create(recursive: true);
    print('token: token13');
    var dbPath = join(dir.path, 'application.db');

    print('token: token1');
    Database db = await databaseFactoryIo.openDatabase(dbPath).catchError((onError) => {
      print('onError $onError')
    });
    print('token: token2');
    var store = StoreRef.main();
    print('token: token3');
    var token = await store.record('auth_token').get(db) as String;
    print('token: token');
    print('token: $token');
    if (token?.length != 0) return EventsPage();

//    String loginUser = await storage.read(key: "auth_token");
//    if (loginUser is String && loginUser.length != 0) return EventsPage();
    return EventsPage();
  } catch (e) {
    print(e);
    return LoginPage();
  }
}

void main() async {
//  BlocSupervisor.delegate = await HydratedBlocDelegate.build();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  var defaultWidget = await getDefaultWidget();

  initializeDateFormatting().then((_) {
    runApp(MaterialApp(
      title: 'CreatePlaySeek',
      debugShowCheckedModeBanner: false,
//      supportedLocales: [
//        const Locale('uk'),
//      ],
//      localizationsDelegates: [
//        GlobalMaterialLocalizations.delegate,
//        GlobalWidgetsLocalizations.delegate,
//      ],
//      locale: Locale('uk'),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: defaultWidget,
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
