import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ukuya_assestment/contracts/BookContracts.dart';
import 'package:ukuya_assestment/struct/Book.dart';

class BookModel implements BookModelContract, BookInfoModelContract {
  SharedPreferences prefs;
  List<Book> bookDetails = List<Book>();
  List<Map> booksInJson = List<Map>();
  List details = [];

  @override
  saveDetails(Book book) async {
    this.booksInJson = await this._loadBooksFromSharedPreference();
    this.booksInJson.add(book.toJson());

    prefs = await SharedPreferences.getInstance();
    prefs.setString('books', jsonEncode(this.booksInJson));
  }

  Future _loadBooksFromSharedPreference() async {
    List<Map> tmp = List<Map>();
    prefs = await SharedPreferences.getInstance();

    if(prefs.get('books') != null) {

      List<dynamic> stringList = jsonDecode(prefs.get('books'));

      stringList.forEach((book) => tmp.add(new Book(book).toJson()));
    }

    return tmp;
  }

  @override
  passToView() async{

    prefs = await SharedPreferences.getInstance();
    if(prefs.get('books') != null) {

      details = jsonDecode(prefs.get('books'));

    }
    return details;
  }


  @override
  setSharedPreference(Map info) async{
    prefs = await SharedPreferences.getInstance();
    prefs.setString("info", jsonEncode(info));
  }

  @override
  getSharedPrefernce() async{
    prefs = await SharedPreferences.getInstance();
    Map info = jsonDecode(prefs.get('info'));
    return info;
  }

  @override
  returnBook(book) async{

    List adds=[];

    List test = jsonDecode(prefs.get('books'));

    test.forEach((books) => {
      if(books["name"] != book["name"]) {
        adds.add(books),
      }
    });

    prefs = await SharedPreferences.getInstance();
    prefs.setString('books', jsonEncode(adds));
  }

}