import 'package:flutter/material.dart';
import '../../sport_types.dart';

class ProfileSettings extends StatefulWidget {

  @override
  ProfileSettingsState createState() => ProfileSettingsState();

}

class ProfileSettingsState extends State<ProfileSettings> {

  final userSportTypes = List.from(sportTypes);

  var selectedSportTypes = [];

  setChanges() {
    setState(() {

    });
  }

  switchSportTypesListItem(sportType) {
    setState(() {
      if (selectedSportTypes.contains(sportType.title)) {
        selectedSportTypes = selectedSportTypes.where((st) => st != sportType.title).toList();
      } else selectedSportTypes.add(sportType.title);
    });
  }

  _userSportTypesCards() {
    return GridView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
      ),
      children: userSportTypes.map((sportType) => GestureDetector(
        onTap: () {
          switchSportTypesListItem(sportType);
        },
        child: Card(
          color: selectedSportTypes.contains(sportType.title) ? Colors.blue[400] : null,
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 10, bottom: 20),
                  child: Text(
                      sportType.title,
                      style: TextStyle(
                        color: selectedSportTypes.contains(sportType.title) ? Colors.white : null
                      ),
                  ),
                ),
                Image(image: AssetImage(sportType.imagePath), width: 80),
              ],
            ),
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
          color: Colors.white,
          child: Text('Налаштування профіля'),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Text('Особиста інформація'),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.46,
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Ім\'я',
                            border: OutlineInputBorder()
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.46,
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Призвіще',
                            border: OutlineInputBorder()
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Користувацьке ім\'я',
                      border: OutlineInputBorder()
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Divider(),
              ),
              Text('Конфіденційність'),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: 'Електронна адреса',
                      border: OutlineInputBorder()
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: 'Новий пароль',
                      border: OutlineInputBorder()
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Divider(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 2, bottom: 8),
                child: Text('Захоплення та види спорту'),
              ),
              _userSportTypesCards(),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Divider(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.46,
                    child: RaisedButton(
                      child: Text('Видалити аккаунт'),
                      color: Colors.red,
                      textColor: Colors.white,
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.46,
                    child: OutlineButton(
                      child: Text('Вийти'),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(top: 0, bottom: 4, right: 12, left: 12),
        child: RaisedButton(
          color: Colors.blue,
          textColor: Colors.white,
          disabledColor: Colors.grey[400],
          child: Text('Застосувати зміни'),
          onPressed: true ? null : setChanges,
        ),
      ),
    );
  }

}
