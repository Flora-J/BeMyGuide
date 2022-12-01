import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ApiController {


  static getUserFromApi() async {
    var url = Uri.http("10.0.2.2:8080", "/api/v1/users");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
      var apiGetAllUsers = jsonResponse;
      return apiGetAllUsers;
    } else {
      print("Request failed: ${response.statusCode}");
    }
  }
}
