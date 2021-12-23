import 'package:flutter/material.dart';
import 'package:flutter_launcher/models/book.dart';
import 'package:flutter_launcher/models/helper.dart';
import 'package:flutter_launcher/pages/quick_view.dart';

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

    //books = Helper.getBag();
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
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      Helper.removeBook(books.elementAt(index));
                    });
                  },
                ),
                onTap: () {},
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
            }),
      ),
      //     FutureBuilder(
      //   future: Helper.getBag(),
      //   builder: (BuildContext context, AsyncSnapshot snapshot) {
      //     if (snapshot.hasData) {
      //       books = snapshot.data;
      //       return ListView.builder(
      //           itemCount: books.length,
      //           itemBuilder: (context, int index) {
      //             return ListTile(
      //               title: Text(books.elementAt(index).title),
      //               subtitle: Text(books.elementAt(index).author),
      //               leading: Container(
      //                 width: 36,
      //                 height: 36,
      //                 child: Image.network(
      //                   books.elementAt(index).icon,
      //                   fit: BoxFit.cover,
      //                 ),
      //               ),
      //               trailing: IconButton(
      //                 icon: Icon(Icons.cancel),
      //                 onPressed: () {
      //                   setState(() {
      //                     Helper.removeBook(books.elementAt(index));
      //                   });
      //                 },
      //               ),
      //             );
      //           });
      //     } else {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //   },
      // ),
    );
  }
}
