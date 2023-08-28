import 'package:flutter/material.dart';
import 'package:tutorial3/screens/dashboard_page/dashboard_page_widget.dart';
import 'package:tutorial3/screens/login_page/login_page_model.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginPageModel _model;
  @override
  void initState() {
    super.initState();
    _model = context.read<LoginPageModel>();
    _model.usernameController = TextEditingController();
    _model.passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    print("building");
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                key: const Key("username_text"),
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
                controller: _model.usernameController,
              ),
              SizedBox(height: 16.0),
              TextField(
                key: const Key("password_text"),
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                controller: _model.passwordController,
              ),
              SizedBox(height: 24.0),
              Consumer<LoginPageModel>(
              builder: (__, provider, _) {
                if(!provider.loginFormValid){
                  return const Text("Username / Password is required", style: TextStyle(color: Colors.red));
                } else {
                  return const Text("");
                }
              }
              ),
              ElevatedButton(
                key: const Key("login_btn"),
                onPressed: () {
                  // Add login logic here
                  _model.login(context);
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
