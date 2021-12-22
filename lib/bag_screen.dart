import 'package:flutter/material.dart';

import 'models/book.dart';
import 'models/helper.dart';

class BagScreen extends StatefulWidget {
  const BagScreen({Key? key}) : super(key: key);

  @override
  _BagScreenState createState() => _BagScreenState();
}

class _BagScreenState extends State<BagScreen> {
  List<Book> books = [];

  @override
  void initState() {
    super.initState();

    books = Helper.getBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Список для чтения"),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: books.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(books.elementAt(index).title),
                leading: Icon(Icons.shopping_bag),
              );
            }),
      ),
    );
  }
}
