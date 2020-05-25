import 'package:flutter/material.dart';
import '../../sport_types.dart';
import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget with RouteAware {

  @override
  ProfilePageState createState() => ProfilePageState();

}

class ProfilePageState extends State<ProfilePage> {
  static final userProfileSportTypes = [];

  final userSportTypes = List.from(sportTypes); // .map(userProfileSportTypes.contains);

  @override
  didChangeDependencies() async {
    super.didChangeDependencies();
    final user = await http.get('http://localhost:4000/users/get/mark');
    print(user);
//    final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

//    routeObserver.subscribe(this, ModalRoute.of(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Title(
          color: Colors.white,
          child: Text('Профіль'),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/profile-settings');
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage('https://www.gettyimages.com/gi-resources/images/500px/983794168.jpg'),
                    backgroundColor: Colors.transparent,
                    radius: 90,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 18),
                    child: Text(
                      'Марк Ярчак • 18 років',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 6),
                    child: Text(
                      '@markyarchak',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 26, bottom: 10),
                    child: Divider(color: Colors.black54),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text('Улюблені види спорту', style: TextStyle(fontWeight: FontWeight.w600)),
                  ),
                  Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black54, width: 2)
                    ),
                    child: Column(
                      children: userSportTypes.length != 0 ? userSportTypes.map((sportType) => ListTile(
                        contentPadding: EdgeInsets.only(bottom: 4, top: 4, left: 16, right: 16),
                        leading: Image(image: AssetImage(sportType.imagePath), width: 45),
                        title: Text(sportType.title, style: TextStyle(fontSize: 16)),
                      )).toList() : <Widget>[
                        ListTile(
                          contentPadding: EdgeInsets.only(bottom: 4, top: 4, left: 16, right: 16),
                          leading: Icon(Icons.close, size: 26),
                          title: Text('Немає улюблених видів', style: TextStyle(fontSize: 16)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
