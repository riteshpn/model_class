import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:model_class/authentication/home.dart';

class authsighnIn extends StatefulWidget {
  const authsighnIn({Key? key}) : super(key: key);

  @override
  State<authsighnIn> createState() => _authsighnInState();
}

class _authsighnInState extends State<authsighnIn> {
  final _auth = FirebaseAuth.instance;

  String? email;

  String? password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade100,
      appBar: AppBar(
        title: const Text(
          'Authentication SighUP',
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: Container(
              child: TextField(
                decoration: const InputDecoration(labelText: 'Email Address'),
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: TextField(
              decoration: const InputDecoration(labelText: "Password"),
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
              obscureText: true,
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                try {
                  final newuser = await _auth.createUserWithEmailAndPassword(
                      email: email.toString(), password: password.toString());
                  if (newuser != null) {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder:(context) => authsighnIn()));
                  }
                } catch (e) {
                  print(e);
                }
              },
              child: Text('save')),
          
        ],
      ),
    );
  }
}
