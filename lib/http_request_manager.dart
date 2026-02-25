import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpRequestManager {
  final http.Client _client = http.Client();

  Future<http.Response> post(String url, Map<String, String> body) async {
    // 1. Make a GET request to obtain the CSRF cookie.
    final getResponse = await _client.get(Uri.parse(url));

    String? csrfToken;
    String? sessionCookie;

    // Extract the cookie(s) from the 'set-cookie' header of the GET response.
    String? rawCookie = getResponse.headers['set-cookie'];
    if (rawCookie != null) {
      sessionCookie = rawCookie;
      // Find the specific 'csrftoken' value within the cookie string.
      RegExp regExp = RegExp(r'csrftoken=([^;]+)');
      Match? match = regExp.firstMatch(rawCookie);
      if (match != null && match.groupCount >= 1) {
        csrfToken = match.group(1);
      }
    }

    if (csrfToken == null) {
      throw Exception(
          "CSRF token not found in response from server. Check if the backend is setting the 'csrftoken' cookie correctly.");
    }

    // 2. Now, make the actual POST request with the CSRF token and cookie.
    final postHeaders = {
      'Content-Type': 'application/json; charset=UTF-8',
      'X-CSRFToken': csrfToken, // Django expects the token in this header.
      'Cookie': sessionCookie ?? '', // Send the full cookie back to the server.
      'Referer': url, // It's good practice to include the Referer header.
    };

    final postResponse = await _client.post(
      Uri.parse(url),
      headers: postHeaders,
      body: jsonEncode(body),
    );

    return postResponse;
  }

  // Method to close the client and release resources.
  void dispose() {
    _client.close();
  }
}
