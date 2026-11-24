import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tutorial3/model/login_model.dart';

part 'login_page_model.g.dart';

class LoginPageState {
  const LoginPageState({
    this.loginFormValid = true,
    this.firstName = '',
    this.isLoading = false,
  });

  final bool loginFormValid;
  final String firstName;
  final bool isLoading;
}

@riverpod
class LoginPageModel extends _$LoginPageModel {
  @override
  LoginPageState build() => const LoginPageState();

  Future<bool> login(String username, String password) async {
    if (username.isEmpty || password.isEmpty) {
      state = const LoginPageState(loginFormValid: false);
      return false;
    }

    state = const LoginPageState(isLoading: true);
    try {
      final response = await performLoginPost(username, password);
      state = LoginPageState(firstName: response.firstName);
      return true;
    } catch (_) {
      state = const LoginPageState(loginFormValid: false);
      return false;
    }
  }

  Future<LoginResponse> performLoginPost(
    String username,
    String password,
  ) async {
    final response = await http.post(
      Uri.parse('https://dummyjson.com/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        LoginRequest(username: username, password: password).toJson(),
      ),
    );
    if (response.statusCode == 200) {
      return LoginResponse.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed to perform login, ${response.body}');
  }
}
