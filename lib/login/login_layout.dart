import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'register.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Title(
              child: Text('CreatePlaySeek'),
              color: Colors.white,
            ),
            bottom: TabBar(
              tabs: [
                Tab(text: 'Увійти'),
                Tab(text: 'Зареєструватись'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              LoginTabContent(),
              RegisterTabContent(),
            ],
          ),
        ),
      ),
    );
  }
}

