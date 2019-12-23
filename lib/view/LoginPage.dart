
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> {

  TextEditingController _username = new TextEditingController();
  TextEditingController _password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Student Library Management")),
      body: SafeArea(
          child: ListView(
            padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            children: <Widget>[
              TextField(
                controller: _username,
                decoration: InputDecoration(
                    filled: true,
                    labelText: 'Username'
                ),
              ),
              SizedBox(height: 5.0),
              TextField(
                controller: _password,
                decoration: InputDecoration(
                    filled: true,
                    labelText: 'Password'
                ),
                obscureText: true,
              ),
              SizedBox(height: 10.0),
              RaisedButton(
                child: Text('LOGIN'),
                onPressed: () {
                  //Navigator.of(context).pushNamed('homepage');
                },
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 15),
                    child: Text(
                        "No Account?"
                    ),
                  ),
                  InkWell(
                    child: Text(
                      " Register Here",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        //fontSize: 18
                      ),
                    ),
                    onTap: () {
                      //_launchURL();
                      Navigator.pushNamed(context, 'register');
                    },
                  )
                ],
              ),
            ],
          )
      )
    );
  }

}