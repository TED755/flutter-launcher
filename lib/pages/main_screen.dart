import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_launcher/models/book.dart';
import 'package:flutter_launcher/pages/quick_view.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_launcher/models/api.dart';
import 'package:flutter_launcher/models/helper.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Book> books = [];
  List<Book> bag = [];

  @override
  void initState() {
    books = Helper.getBooks();
    //bag = Helper.getAllBooks();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Все книги"),
      ),
      body: FutureBuilder(
        future: Helper.getAllBooks(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            books = snapshot.data;
            return ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(books.elementAt(index).title),
                    subtitle: Text(books.elementAt(index).author),
                    leading: Container(
                      width: 36,
                      height: 36,
                      child: Image.network(
                        books.elementAt(index).icon.toString(),
                        fit: BoxFit.cover,
                      ),
                    ),
                    trailing: IconButton(
                      // icon: Icon(Helper.isFavorite(books.elementAt(index))
                      //     ? Icons.cancel
                      //     : Icons.add),
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          print("index: ${index}");
                          print(Helper.bag.contains(books.elementAt(index)));
                          //print(Helper.isFavorite(books.elementAt(index)));
                          if (Helper.isFavorite(books.elementAt(index))) {
                            //bag.remove(books.elementAt(index));
                            Helper.removeBook(books.elementAt(index));
                            //print(bag);
                          } else {
                            Helper.addBook(books.elementAt(index));
                            //bag.add(books.elementAt(1));
                            //print(bag);
                            //print(books.elementAt(index).title);
                            //print(bag);
                          }
                          //print(bag.length);
                        });
                      },
                    ),
                    onLongPress: () {
                      // Navigator.push(
                      //     context,
                      //     CupertinoPageRoute(
                      //       builder: (_) =>
                      //           QuickView(thisBook: books.elementAt(index)),
                      //     ));
                      showDialog(
                          context: context,
                          builder: (context) {
                            return QuickView(thisBook: books.elementAt(index));
                          });
                    },
                  );
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
