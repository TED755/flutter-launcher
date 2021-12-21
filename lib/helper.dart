import 'package:flutter/material.dart';

class Helper {
  static List<String> books = [];

  static addBook(String name) {
    if (!books.contains(name)) {
      books.add(name);
    }
  }

  static removeBook(String name) {
    if (books.contains(name)) {
      books.remove(name);
    }
  }

  static isFavorite(String name) {
    return books.contains(name);
  }

  static getBagBooks() {
    return books;
  }
}
