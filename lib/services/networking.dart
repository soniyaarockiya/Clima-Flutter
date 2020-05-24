import 'package:http/http.dart' as http;
import 'dart:convert';

//Makes Api call to get the Json response
class Networking {
  Future<dynamic> getData(url) async {
    http.Response response = await http.get(url);
    print(response.body);

    if (response.statusCode == 200) {
      dynamic jsonResponse = jsonDecode(response.body);
      return jsonResponse;
    }
  }
}
