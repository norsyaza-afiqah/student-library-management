class Book {
  String name;
  String borrowDate;
  String returnDate;

  Book(data) {
    this.name = data['name'];
    this.borrowDate = data['borrowDate'];
    this.returnDate = data['returnDate'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name'        : this.name.toString(),
      'borrowDate'  : this.borrowDate.toString(),
      'returnDate'  : this.returnDate.toString()
    };
  }
}