import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_launcher/api.dart';
import 'package:flutter_launcher/models/helper.dart';

import 'models/book.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Book> books = [];

  @override
  void initState() {
    books = Helper.getBooks();
    Helper.getAllBooks();

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
        //future: API().getData(),
        // builder: (context, snapshot) {
        //   if (snapshot.hasData) {
        //     //snapshot.data.toString();
        //     //var json = snapshot.data.
        //     //List<dynamic> data = jsonDecode(snapshot.data.body);
        //     //var books = API().getData();
        //     //Object? data = snapshot.toString();
        //     //List<dynamic> jsonData = json.decode(utf8.decode(.bodyBytes));
        //     return ListView.builder(
        //         itemCount: 10,
        //         itemBuilder: (context, index) {
        //           Book book =
        //               Book.handMade(index, "Книга ${(index + 1).toString()}");
        //           //var appName = "Книга ${(index + 1).toString()}";
        //           return ListTile(
        //             title: Text(book.title),
        //             leading: Icon(Icons.shopping_bag),
        //             trailing: IconButton(
        //               icon: Icon(Helper.isFavorite(book)
        //                   ? Icons.cancel
        //                   : Icons.add_shopping_cart_rounded),
        //               onPressed: () {
        //                 setState(() {
        //                   if (Helper.isFavorite(book)) {
        //                     Helper.removeBook(book);
        //                   } else {
        //                     Helper.addBook(book);
        //                   }
        //                 });
        //               },
        //             ),
        //           );
        //         });
        //   } else {
        //     return const Center(
        //       child: CircularProgressIndicator(),
        //     );
        //   }
        // },
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            books = snapshot.data;
            //snapshot.data.toString();
            //var json = snapshot.data.
            //List<dynamic> data = jsonDecode(snapshot.data.body);
            //var books = API().getData();
            //Object? data = snapshot.toString();
            //List<dynamic> jsonData = json.decode(utf8.decode(.bodyBytes));
            return ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, int index) {
                  //Book book =
                  //Book.handMade(index, "Книга ${(index + 1).toString()}");
                  //var appName = "Книга ${(index + 1).toString()}";
                  return ListTile(
                    title: Text(books.elementAt(index).title),
                    subtitle: Text(books.elementAt(index).author),
                    leading: Icon(Icons.shopping_bag),
                    /*trailing: IconButton(
                      icon: Icon(Helper.isFavorite(book)
                          ? Icons.cancel
                          : Icons.add_shopping_cart_rounded),
                      onPressed: () {
                        setState(() {
                          if (Helper.isFavorite(book)) {
                            Helper.removeBook(book);
                          } else {
                            Helper.addBook(book);
                          }
                        });
                      },
                    ),*/
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
