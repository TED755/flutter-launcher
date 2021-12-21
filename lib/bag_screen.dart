import 'package:flutter/material.dart';

import 'helper.dart';

class BagScreen extends StatefulWidget {
  const BagScreen({Key? key}) : super(key: key);

  @override
  _BagScreenState createState() => _BagScreenState();
}

class _BagScreenState extends State<BagScreen> {
  List<String> books = [];

  @override
  void initState() {
    super.initState();

    books = Helper.getBagBooks();
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
              var appName = books[index];
              return ListTile(
                title: Text(appName),
                leading: Icon(Icons.shopping_bag),
              );
            }),
      ),
    );
  }
}
