import 'package:http/http.dart' as http;

class API {
  static Future<http.Response?> getData() async {
    var response = await http
        .get(Uri.parse("https://61c2ddfe9cfb8f0017a3e70f.mockapi.io/books"));

    if (response.statusCode == 200) {
      return response;
    } else {
      return null;
    }
  }
}
