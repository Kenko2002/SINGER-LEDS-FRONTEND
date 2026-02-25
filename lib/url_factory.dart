enum Url { login }

abstract class UrlFactory {
  static String get(Url url) {
    switch (url) {
      case Url.login:
        return '/api/login/';
    }
  }
}
