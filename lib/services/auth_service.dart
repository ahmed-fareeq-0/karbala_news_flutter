import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static Future<void> login(
      String email, String password, Function(bool) onLoginResult) async {
    try {
      onLoginResult(true);
      http.Response response = await http.post(
        Uri.parse('https://reqres.in/api/login'),
        body: {'email': email, 'password': password},
      );

      print(response.body);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data['token']);
        print('Login successfully');
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', data["token"]);
        onLoginResult(true);
      } else {
        onLoginResult(false);
        print('failed');
      }
    } catch (e) {
      onLoginResult(false);
      print(e.toString());
    }
  }

  static Future<void> register(String email, String password) async {
    try {
      http.Response response = await http.post(
        Uri.parse('https://reqres.in/api/register'),
        body: {'email': email, 'password': password},
      );

      print(response.body);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data);
        print('register successfully');
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
