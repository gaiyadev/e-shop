import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String _token;
  DateTime _expireDate;
  String _userId;

  Future<void> signup(String email, String password) async {
    const url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBZrYGSv3WHkfxAQUmtwnoD-FDByQmDgcs';
    try {
      final response = await http.post(
        url,
        body: jsonEncode({
          'email': email,
          'password': password,
          'refreshToken': true,
        }),
      );
      if (response.statusCode == 200) {
        print(jsonDecode(response.body));
      }
    } catch (e) {
      throw e;
    }
  }
}
