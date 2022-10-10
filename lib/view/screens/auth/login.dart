import 'package:flutter/material.dart';
import 'package:tiktok/controller/auth_controller.dart';

import '../../widgets/from.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'TikTok',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: LoginTextField(
                  controller: _emailController,
                  myLabelText: "Email",
                  myIcon: Icons.email,
                  hide: false,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: LoginTextField(
                  controller: _passwordController,
                  myLabelText: "Password",
                  myIcon: Icons.lock,
                  hide: true,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  AuthController.instance
                      .login(_emailController.text, _passwordController.text);
                },
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10),
                    child: const Text('Login')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
