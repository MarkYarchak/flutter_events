import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginTabContent extends StatefulWidget {

  @override
  _LoginTabView createState() => _LoginTabView();

}

class _LoginTabView extends State<LoginTabContent> {

  onLoginPressed() {
    Navigator.pushNamedAndRemoveUntil(context, '/events', (Route<dynamic> route) => false);
  }


  Future<void> forgotPasswordDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(6))
          ),
          title: Text('Відновлення пароля'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Введіть вашу елекронну адресу'),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Email',
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.only(left: 12, right: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                      child: Text('Закрити'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    RaisedButton(
                      padding: EdgeInsets.only(top: 12, bottom: 12, left: 18, right: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      color: Colors.blue,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Подати',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 21, bottom: 21),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: 'Електронна адреса',
                    border: OutlineInputBorder()
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
                padding: EdgeInsets.only(top: 30, right: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    OutlineButton(
                      padding: EdgeInsets.only(top: 12, bottom: 12, left: 14, right: 14),
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      color: Colors.blue,
                      onPressed: forgotPasswordDialog,
                      child: Text(
                        'Відновити',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    RaisedButton(
                      padding: EdgeInsets.only(top: 12, bottom: 12, left: 18, right: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      color: Colors.blue,
                      onPressed: onLoginPressed,
                      child: Text(
                        'Підтвердити',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}