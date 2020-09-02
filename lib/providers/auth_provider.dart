import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:state_management/models/http_exception.dart';

class Auth with ChangeNotifier {
  String _token;
  DateTime _expireDate;
  String _userId;

  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyBZrYGSv3WHkfxAQUmtwnoD-FDByQmDgcs';
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
        //Succes code here
      } else {
        final responseData = jsonDecode(response.body);
        throw HttpException(responseData['error']['message']);
      }
    } catch (err) {
      throw err;
    }
  }

//Sign up logic
  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, 'signUp');
  }

//login logic
  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'signInWithPassword');
  }
}
