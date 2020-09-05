import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:state_management/models/http_exception.dart';

const API_KEY = 'AIzaSyBZrYGSv3WHkfxAQUmtwnoD-FDByQmDgcs';

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;

  bool get isAuth {
    return token != null;
  }

  String get token {
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  String get userId {
    return _userId;
  }

  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=$API_KEY';
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
        final responseData = jsonDecode(response.body);
        print(responseData);
        _token = responseData['idToken'];
        _userId = responseData['localId'];
        _expiryDate = DateTime.now().add(
          Duration(
            seconds: int.parse(responseData['expiresIn']),
          ),
        );
        notifyListeners();
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

  void logout() {
    _token = null;
    _userId = null;
    _expiryDate = null;
    notifyListeners();
  }
}
