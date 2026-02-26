enum Url { login }

abstract class UrlFactory {
  // 1. Defina a sua URL base aqui (sem a barra no final)
  static const String baseUrl = 'http://127.0.0.1:8000';

  static String get(Url url) {
    switch (url) {
      case Url.login:
        // 2. Junte a base com o caminho específico
        return '$baseUrl/api/login/';
    }
  }
}