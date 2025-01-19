import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:calisthenics_app/config.dart';

class AuthService {
  // Future<http.Response>
  Future signUp(String name, String surname, String username, email,
      String password) async {
    String url = AppConfig.apiBaseUrl;
    print('URL: $url');
    print('Payload: $name. $surname. $username. $email, $password');
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

    return response;
  }
}
