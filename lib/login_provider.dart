import 'package:flutter/material.dart';
import 'http_request_manager.dart';
import 'url_factory.dart';

class LoginProvider with ChangeNotifier {
  final HttpRequestManager _requestManager = HttpRequestManager();
  bool _isLoading = false;
  String? _errorMessage;
  String? _loginResponse;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  String? get loginResponse => _loginResponse;

  Future<void> login(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    _loginResponse = null;
    notifyListeners();

    try {
      final response = await _requestManager.post(
        UrlFactory.get(Url.login),
        {'email': email, 'password': password},
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        _loginResponse = response.body;
      } else {
        _errorMessage = 'Error: ${response.statusCode}\nBody: ${response.body}\nHeaders: ${response.headers}';
      }
    } catch (e) {
      _errorMessage = 'Error: $e';
    }

    _isLoading = false;
    notifyListeners();
  }
}
