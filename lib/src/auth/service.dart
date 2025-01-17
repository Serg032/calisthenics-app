import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  Future<http.Response> signUp(
      String name, String surname, String username, email, String password) {
    return http.post(Uri.parse('example'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body:
            jsonEncode(<String, String>{'email': email, 'password': password}));
  }
}
