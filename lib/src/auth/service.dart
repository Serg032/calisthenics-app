import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:calisthenics_app/config.dart';

class AuthService {
  // Future<http.Response>
  Future<bool> signUp(String name, String surname, String username,
      String email, String password) async {
    String url = AppConfig.apiBaseUrl;
    dynamic response = await http.post(Uri.parse('$url/user'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
          'name': name,
          'surname': surname,
          'username': username
        }));
    print('Response: ${response.body}');

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
