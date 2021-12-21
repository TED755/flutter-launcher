import 'package:flutter/material.dart';
import 'package:flutter_launcher/helper.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Все книги"),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              var appName = "Книга ${(index + 1).toString()}";
              return ListTile(
                title: Text(appName),
                leading: Icon(Icons.shopping_bag),
                trailing: IconButton(
                  icon: Icon(Helper.isFavorite(appName)
                      ? Icons.cancel
                      : Icons.add_shopping_cart_rounded),
                  onPressed: () {
                    setState(() {
                      if (Helper.isFavorite(appName)) {
                        Helper.removeBook(appName);
                      } else {
                        Helper.addBook(appName);
                      }
                    });
                  },
                ),
              );
            }),
      ),
    );
  }
}
