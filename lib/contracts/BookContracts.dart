
import 'package:ukuya_assestment/struct/Book.dart';

abstract class BookModelContract {
  saveDetails(Book book);
  passToView();
  setSharedPreference(Map info);
}

abstract class BookPresenterContract {
  Future viewDisplayed();
  saveInfo(Map info);
}

abstract class BookViewContract {
  void showBorrowedBook(List bookDetails);
}

//scan
abstract class ScanBookPresenterContract {
  void saveDetails(Book book);
}

abstract class ScanBookViewContract {
  void saveDetailInModel(String input);
}

//book detail
abstract class BookInfoPresenterContract {
  Future bookInfo();
  returnBook(Map book);
}

abstract class BookInfoViewContract {
  displayInfo(info);
}

abstract class BookInfoModelContract {
  getSharedPrefernce();
  returnBook(book);
}

