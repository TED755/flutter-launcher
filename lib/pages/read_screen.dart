import 'package:flutter/material.dart';
import 'package:flutter_launcher/models/book.dart';

class ReadScreen extends StatefulWidget {
  final Book thisBook;
  ReadScreen({Key? key, required this.thisBook}) : super(key: key);

  @override
  _ReadScreenState createState() => _ReadScreenState(thisBook);
}

class _ReadScreenState extends State<ReadScreen> {
  final Book thisBook;

  _ReadScreenState(this.thisBook);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(thisBook.title)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Text(thisBook.fullText),
            ),
          )
        ],
      ),
    );
  }
}
