
import 'package:ukuya_assestment/contracts/BookContracts.dart';
import 'package:ukuya_assestment/struct/Book.dart';

class AddBookPresenter implements BookPresenterContract{

  BookModelContract _model;
  BookViewContract _view;

  AddBookPresenter (this._model, this._view);

  @override
  Future viewDisplayed() async{
    List bookDetails =  await _model.passToView();
    _view.showBorrowedBook(bookDetails);
  }

  @override
  saveInfo(Map info) {
    _model.setSharedPreference(info);
  }
}

class ScanBookPresenter implements ScanBookPresenterContract {
  BookModelContract _model;
  ScanBookViewContract _view;

  ScanBookPresenter (this._model, this._view);

  @override
  void saveDetails(Book book) {
    _model.saveDetails(book);
  }
}

class BookInfoPresenter implements BookInfoPresenterContract {

  BookInfoModelContract _model;
  BookInfoViewContract _view;

  BookInfoPresenter(this._model,this._view);

  @override
  Future bookInfo() async{
    Map info = await _model.getSharedPrefernce();
    _view.displayInfo(info);
  }

  @override
  returnBook(Map book) {
    _model.returnBook(book);
  }

}