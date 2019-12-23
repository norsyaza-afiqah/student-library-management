
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ukuya_assestment/contracts/BookContracts.dart';
import 'package:ukuya_assestment/model/BookModel.dart';
import 'package:ukuya_assestment/presenters/BookPresenter.dart';

class BookInfo extends StatefulWidget {
  @override
  BookInfoState createState() => new BookInfoState();
}

class BookInfoState extends State<BookInfo> implements BookInfoViewContract{

  Map infos;
  BookInfoPresenter _presenter;

  @override
  void initState() {
    super.initState();
    _presenter =  new BookInfoPresenter(new BookModel(),this);
    _presenter.bookInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Student Library Management')),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Card(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text("Book Title: "),
                    Text(this.infos['name'])
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("Borrow Date: "),
                    Text(this.infos['borrowDate'])
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("Return Date: "),
                    Text(this.infos['returnDate'])
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete_outline),
        onPressed: () async{
          await showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog (
                  title: new Text("Delete Domain"),
                  content: new Text("Do you want to delete this domain name ?"),
                  actions: <Widget>[
                    new FlatButton(
                      child: new Text("Yes"),
                      onPressed: () {
                        _presenter.returnBook(infos);
                        Navigator.of(context).pop();
                      },
                    ),
                    new FlatButton(
                      child: new Text("Close"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                );
              }
          );
          Navigator.of(context).pushNamedAndRemoveUntil('homepage', (Route<dynamic>route) => false);
        },
      ),
    );
  }


  @override
  displayInfo(info) {
    setState(() {
      this.infos = info;
    });
  }


}