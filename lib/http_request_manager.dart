import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpRequestManager {
  final http.Client _client = http.Client();

  /// Faz uma requisição POST limpa e direta
  Future<http.Response> post(String url, Map<String, dynamic> body) async {
    
    // Cabeçalhos padrão indicando que estamos enviando e esperando JSON
    final headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
    };

    // Dispara o POST diretamente, sem frescuras
    final response = await _client.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(body),
    );

    return response;
  }

  /// Faz uma requisição GET (Você vai usar isso depois para listar os dados)
  Future<http.Response> get(String url) async {
    
    final headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
    };

    final response = await _client.get(
      Uri.parse(url),
      headers: headers,
    );

    return response;
  }

  /// Fecha o cliente HTTP quando não for mais usado
  void dispose() {
    _client.close();
  }
}