import 'package:flutter/material.dart';
import 'package:flutter_launcher/models/book.dart';
import 'package:flutter_launcher/models/helper.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<Book> bagBooks = [];

  @override
  void initState() {
    bagBooks = Helper.getBag();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Профиль")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
              aspectRatio: 1,
              child: Image.network(
                "https://mobimg.b-cdn.net/v3/fetch/c4/c493aac67877288476b0fc52d55f55cf.jpeg",
                fit: BoxFit.cover,
              )),
          Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Евгений Тихомиров",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const Text("Дата рождения: 25.12.1998"),
                  Text(
                      "Количество книг в спсике для чтения: ${bagBooks.length}"),
                ],
              ))
        ],
      ),
    );
  }
}
