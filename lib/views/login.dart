import 'package:flutter/material.dart';
import 'package:kuis/controllers/logincontroller.dart';
import 'package:kuis/root.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final LoginController _loginController = LoginController();

  bool isLoggedin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://play-lh.googleusercontent.com/bB_cyOTbQfFmV4IaeqTIFJVc1Wm4UdQwQai8GjthG4uaXrTHNZTKsMtg9_9058GeZGLgoJzIasYYdFkSvdyQ',
                width: 100,
                height: 100,
              ),
              const Text('Selamat datang di Uniqlo, Selamat Berbelanja'),

              _usernameField(_usernameController),

              _passwordField(_passwordController),

              ElevatedButton(
                child: const Text('Login'),
                onPressed: () {
                  final username = _usernameController.text;
                  final result = _loginController.login(
                    username,
                    _passwordController.text,
                  );

                  if (result) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Root(username: username),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Username atau password salah'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white60,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _usernameField(TextEditingController controller) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        controller: controller,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          labelText: 'Username',
        ),
      ),
    );
  }

  Widget _passwordField(TextEditingController controller) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        controller: controller,
        obscureText: true,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          labelText: 'Password',
        ),
      ),
    );
  }
}
