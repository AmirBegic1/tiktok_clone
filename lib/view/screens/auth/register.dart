import 'package:flutter/material.dart';

import '../../widgets/from.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _setPasswordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 100),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Wellcome to TikTok',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Stack(
                  children: <Widget>[
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://static.vecteezy.com/system/resources/thumbnails/004/511/281/small/default-avatar-photo-placeholder-profile-picture-vector.jpg'),
                      radius: 60,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                        ),
                        child: const Icon(
                          Icons.edit,
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: LoginTextField(
                    controller: _emailController,
                    myLabelText: "Username",
                    myIcon: Icons.person,
                    hide: false,
                  ),
                ),
                const SizedBox(
                  height: 20,
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
                    controller: _setPasswordController,
                    myLabelText: "Set Password",
                    myIcon: Icons.lock,
                    hide: true,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: LoginTextField(
                    controller: _confirmPasswordController,
                    myLabelText: "Confirm Password",
                    myIcon: Icons.lock,
                    hide: true,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 10),
                      child: const Text('Sign Up')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
