import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            children: [
              const SizedBox(
                height: 50,
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
              Container(
                margin: const EdgeInsets.only(right: 155),
                child: TextButton(
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Get.defaultDialog(
                      radius: 10,
                      backgroundColor: Colors.black,
                      title: 'Enter your email to reset your password',
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: LoginTextField(
                              controller: _emailController,
                              myLabelText: "Email",
                              myIcon: Icons.email,
                              hide: false,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(25),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                              ),
                              child: const Text(
                                'Send request',
                                style: TextStyle(fontSize: 20.0),
                              ),
                              onPressed: () {
                                FirebaseAuth.instance
                                    .sendPasswordResetEmail(
                                        email: _emailController.text)
                                    .then((value) => Get.back());
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: ElevatedButton(
                  onPressed: () {
                    AuthController.instance
                        .login(_emailController.text, _passwordController.text);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      minimumSize: const Size.fromHeight(8),
                      padding: const EdgeInsets.all(8)),
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 10),
                      child: const Text(
                        'Log in',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
