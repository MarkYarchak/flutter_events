import 'package:flutter/material.dart';


class RegisterTabContent extends StatefulWidget {

  @override
  _RegisterTabView createState() => _RegisterTabView();

}

class _RegisterTabView extends State<RegisterTabContent> {

  TextEditingController birthdayFieldController = TextEditingController();

  DateTime hiddenDateBirthday = DateTime.now();

  @override
  void initState() {
    birthdayFieldController = TextEditingController(text: createFieldBirthdayDate(hiddenDateBirthday));
    super.initState();
  }

  String createFieldBirthdayDate(DateTime receivedDate) {
    var dateResult = '';
    if (!(receivedDate is DateTime)) receivedDate = DateTime.now();
    var dateDay = int.parse(receivedDate.day.toString());
    var dateMonth = int.parse(receivedDate.month.toString());
    String stringDay = dateDay.toString();
    String stringMonth = dateMonth.toString();
    if (dateDay < 10) stringDay = '0${dateDay.toString()}';
    if (dateMonth < 10) stringMonth = '0${stringMonth.toString()}';
    dateResult = '$stringDay.$stringMonth.${receivedDate.year.toString()}';
    return dateResult;
  }

  setNewBirthdayDate(picked) {
    if (picked != null && picked != hiddenDateBirthday)
      setState(() {
        hiddenDateBirthday = picked;
        birthdayFieldController.text = createFieldBirthdayDate(picked);
      });
  }

  selectBirthdayDate() async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: hiddenDateBirthday,
      firstDate: DateTime(1970),
      lastDate: DateTime.now(),
    );
    setNewBirthdayDate(picked);
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Електронна адреса',
                    border: OutlineInputBorder()
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 26.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Користувацьке ім\'я',
                    border: OutlineInputBorder()
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 26.0),
                child: TextFormField(
                  controller: birthdayFieldController,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    hintText: 'Дата народження',
                    border: OutlineInputBorder()
                  ),
                  readOnly: true,
                  onTap: selectBirthdayDate,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 26.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.44,
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Ім\'я',
                            border: OutlineInputBorder()
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.44,
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
                padding: EdgeInsets.only(top: 26.0),
                child: TextFormField(
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintText: 'Пароль',
                    border: OutlineInputBorder()
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 26.0),
                child: TextFormField(
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintText: 'Повторіть пароль',
                    border: OutlineInputBorder()
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30, right: 6, bottom: 5),
                child: RaisedButton(
                  padding: EdgeInsets.only(top: 12, bottom: 12, left: 18, right: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  color: Colors.blue,
                  onPressed: () {},
                  child: Text(
                    'Створити аккаунт',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}