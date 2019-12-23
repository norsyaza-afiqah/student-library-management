import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ukuya_assestment/presenters/BookPresenter.dart';
import 'package:ukuya_assestment/struct/Book.dart';
import 'package:date_format/date_format.dart';


import '../contracts/BookContracts.dart';
import '../model/BookModel.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> implements BookViewContract, ScanBookViewContract{

  List _bookDetails;
  AddBookPresenter _presenter;
  ScanBookPresenter _scanPresenter;
  SharedPreferences prefs;
  BookInfoPresenter _infoPresenter;
  List bookDetails = [];

  @override
  void initState() {
    super.initState();
    _presenter = new AddBookPresenter(new BookModel(), this);
    _presenter.viewDisplayed();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Student Library Management')),
      body: SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            Container(
              child:
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: _bookDetails == null ? 0:_bookDetails.length,
                  itemBuilder: (BuildContext context, int index) {
                    return new Container(
                      height: 50,
                      child: Card(
                          child: Row(
                            children: <Widget>[
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Text(_bookDetails[index]["name"].toString()),
                                    new Text(_bookDetails[index]["borrowDate"]),
                                  ]
                              ),
                              Expanded(
                                child: IconButton(
                                  icon: Icon(Icons.info_outline),
                                  onPressed: () {
                                    _presenter.saveInfo(_bookDetails[index]);
                                    Navigator.pushNamed(context, 'info');
                                  },
                                ),
                              )
                            ],
                          )
                      ),
                    );
                  }
              ),
            ),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          this.scan();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  void showBorrowedBook(List bookDetails) {
    setState(() {
      _bookDetails = bookDetails;
    });
  }

  scan() async {
    String barcode;
    try {
      barcode = await BarcodeScanner.scan();
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        barcode = 'The user did not grant the camera permission!';
      } else {
        barcode = 'Unknown error: $e';
      }
    } on FormatException{
      barcode = 'null (User returned using the "back"-button before scanning anything. Result)';
    } catch (e) {
      barcode = 'Unknown error: $e';
    }

    this.saveDetailInModel(barcode);
  }

  @override
  void saveDetailInModel(String input) {
     bookDetails = input.split(",");
    _scanPresenter = new ScanBookPresenter(new BookModel(), this);
    _scanPresenter.saveDetails(new Book({
      'name' :bookDetails[0],
      'borrowDate': this.date(),
      'returnDate' : bookDetails[1],
    }));
  }

  date() {
    var today = new DateTime.now();
    var format = "${today.year.toString()}-${today.month.toString().padLeft(2,'0')}-${today.day.toString().padLeft(2,'0')}";

    return format;
  }

}