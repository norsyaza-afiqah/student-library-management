import 'package:flutter/material.dart';
import 'package:ukuya_assestment/view/BookInfo.dart';
import 'package:ukuya_assestment/view/RegisterPage.dart';
import 'view/HomePage.dart';
import 'view/LoginPage.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      routes: {
        'homepage' : (BuildContext context) => HomePage(),
        'info' : (BuildContext context) => BookInfo(),
        'register' : (BuildContext context) => RegisterPage()
      }
    );
  }
 
}



