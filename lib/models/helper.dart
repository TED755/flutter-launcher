import 'dart:convert';

import 'package:flutter_launcher/models/api.dart';

import 'book.dart';

class Helper {
  static List<Book> bag = [];

  static addBook(Book newBook) {
    if (!bag.contains(newBook)) {
      bag.add(newBook);
      // print(bag.length);
      // print(newBook.title);
    }
  }

  static removeBook(Book book) {
    if (bag.contains(book)) {
      bag.remove(book);
    }
  }

  static isFavorite(Book book) {
    // print(bag.length);
    // print(bag.contains(book));
    return bag.contains(book);
  }

  static getBooks() {
    List<Book> booksData = [];

    booksData.add(Book("1", "Пушкин", "Капитанская дочка", "Описание", "Text",
        "http://placeimg.com/640/480/technics", 50));
    booksData.add(Book("2", "Некрасов", "Кому на Руси жить хорошо", "Описание",
        "Text", "http://placeimg.com/640/480/technics", 40));

    booksData.add(Book("3", "Гоголь", "Шинель", "Описание", "Text",
        "http://placeimg.com/640/480/technics", 69));
    booksData.add(Book("4", "Есенин", "Собрание сочинений", "Описание", "Text",
        "http://placeimg.com/640/480/technics", 200));
    return booksData;
  }

  static getAllBooks() async {
    var data = await API.getData();
    if (data != null) {
      List<dynamic> jsonData = json.decode(utf8.decode(data.bodyBytes));
      List<Book> booksData = [];

      booksData =
          jsonData.map((book) => Book.fromJson(book)).toList() as List<Book>;
      return booksData;
    } else {
      return getBooks();
    }
  }

  static List<Book> getBag() {
    return bag;
  }
}
