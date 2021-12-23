import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launcher/models/book.dart';

class QuickView extends StatefulWidget {
  final Book thisBook;

  QuickView({Key? key, required this.thisBook}) : super(key: key);

  @override
  _QuickViewState createState() => _QuickViewState(thisBook);
}

class _QuickViewState extends State<QuickView> {
  final Book thisBook;

  _QuickViewState(this.thisBook);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  thisBook.icon,
                  fit: BoxFit.cover,
                )),
            Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      thisBook.title,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(thisBook.author),
                    Text("Количество страниц: ${thisBook.page_number}"),
                    Text(thisBook.description),
                  ],
                ))
          ],
        ) /*Widget.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("Hui"),
            );
          }),*/
        );
  }
}
