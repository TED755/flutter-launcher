import 'package:flutter_launcher/models/book.dart';
import 'package:flutter_launcher/pages/quick_view.dart';
import 'package:flutter/material.dart';
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
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          if (Helper.isFavorite(books.elementAt(index))) {
                            Helper.removeBook(books.elementAt(index));
                          } else {
                            Helper.addBook(books.elementAt(index));
                          }
                        });
                      },
                    ),
                    onLongPress: () {
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
