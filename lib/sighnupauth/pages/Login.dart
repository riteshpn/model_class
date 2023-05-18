import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:model_class/model.dart';
import 'package:model_class/sighnupauth/pages/screens/Forgotpassword.dart';
import 'package:model_class/sighnupauth/pages/signup.dart';

class login_screen extends StatefulWidget {
  const login_screen({super.key});

  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  TextEditingController emailLoginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  controller: emailLoginController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    enabledBorder: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    enabledBorder: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  var logemail = emailLoginController.text.trim();
                  var logpassword = passwordController.text.trim();
                  try {
                    final User? FirebaseUser = (await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: logemail, password: logpassword))
                        .user;
                    if (FirebaseUser != null) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Model_class()));
                    } else {
                      print('check email and password');
                    }
                  } on FirebaseAuthException catch (e) {
                    print("Error $e");
                  }
                },
                child: const Text('Login'),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ForgotPassword()));
                },
                child: Container(
                  child: const Card(
                      child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('Forgot Password'),
                  )),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SighnUpPage()));
                },
                child: Container(
                  child: const Card(
                      child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('Don"t have an account SignUp'),
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
