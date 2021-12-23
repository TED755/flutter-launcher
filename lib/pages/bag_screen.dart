import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launcher/models/book.dart';
import 'package:flutter_launcher/models/helper.dart';
import 'package:flutter_launcher/pages/quick_view.dart';
import 'package:flutter_launcher/pages/read_screen.dart';

class BagScreen extends StatefulWidget {
  const BagScreen({Key? key}) : super(key: key);

  @override
  _BagScreenState createState() => _BagScreenState();
}

class _BagScreenState extends State<BagScreen> {
  List<Book> books = [];

  @override
  void initState() {
    books = Helper.getBag();
    super.initState();
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
                leading: Container(
                  width: 36,
                  height: 36,
                  child: Image.network(
                    books.elementAt(index).icon,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(books.elementAt(index).title),
                trailing: IconButton(
                  icon: const Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      Helper.removeBook(books.elementAt(index));
                    });
                  },
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (_) =>
                            ReadScreen(thisBook: books.elementAt(index)),
                      ));
                },
                onLongPress: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return QuickView(thisBook: books.elementAt(index));
                      });
                },
              );
            }),
      ),
    );
  }
}
