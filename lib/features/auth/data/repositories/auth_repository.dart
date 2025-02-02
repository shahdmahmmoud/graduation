import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/login/login_request.dart';
import '../models/login/login_response.dart';

class AuthRepository {
  final String _baseUrl = 'https://9f5f-156-197-144-9.ngrok-free.app/api';

  Future<LoginResponse> login(LoginRequest request) async {
    final url = '$_baseUrl/login';
    print('Making request to: $url'); // Debugging

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode == 200) {
      return LoginResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to login: ${response.body}');
    }
  }
}