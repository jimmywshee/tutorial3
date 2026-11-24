import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutorial3/screens/dashboard_page/dashboard_page_widget.dart';
import 'package:tutorial3/screens/login_page/login_page_model.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginState = ref.watch(loginPageModelProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                key: const Key('username_text'),
                decoration: const InputDecoration(labelText: 'Username'),
                controller: usernameController,
              ),
              const SizedBox(height: 16.0),
              TextField(
                key: const Key('password_text'),
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password'),
                controller: passwordController,
              ),
              const SizedBox(height: 24.0),
              if (!loginState.loginFormValid)
                const Text(
                  'Username / Password is required',
                  style: TextStyle(color: Colors.red),
                ),
              ElevatedButton(
                key: const Key('login_btn'),
                onPressed:
                    loginState.isLoading
                        ? null
                        : () async {
                          final success = await ref
                              .read(loginPageModelProvider.notifier)
                              .login(
                                usernameController.text,
                                passwordController.text,
                              );
                          if (success && context.mounted) {
                            Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder:
                                    (context) =>
                                        const DashboardPage(title: 'Dashboard'),
                              ),
                            );
                          }
                        },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
