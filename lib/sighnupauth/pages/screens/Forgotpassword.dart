import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:model_class/sighnupauth/pages/Login.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController UserForgotPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Welcome To HomeScreen'),
        actions: const [Icon(Icons.more_vert_rounded)],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 150,
                child: const CircleAvatar(
                  backgroundColor: Colors.amber,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  controller: UserForgotPassword,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    enabledBorder: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  var forgorpass = UserForgotPassword.text.trim();

                  try {
                    await FirebaseAuth.instance
                        .sendPasswordResetEmail(email: forgorpass)
                        .then((value) => {
                              print("Email sent"),
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => login_screen()))
                            });
                  } on FirebaseAuthException catch (e) {
                    print("Error $e");
                  }
                },
                child: const Text('ForgotPassword'),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
