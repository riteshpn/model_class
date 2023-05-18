import 'package:flutter/material.dart';
import 'package:model_class/authentication/authSighin.dart';
import 'package:model_class/authentication/home.dart';

class authconcept extends StatefulWidget {
  const authconcept({Key? key}) : super(key: key);

  @override
  State<authconcept> createState() => _nameState();
}

class _nameState extends State<authconcept> {
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        title: Text(
          'Authentication login ',
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
                decoration: InputDecoration(labelText: 'Email'),
                onChanged: (value) {
                  setState(() {
                    email = value;
                    print(email);
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
            child: Container(
              child: TextField(
                decoration: InputDecoration(labelText: "Password"),
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                obscureText: true,
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => homeScreen()));
              },
              child: Text('Sigh in')),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => authsighnIn()));
              },
              child: Text('Sighn up'))
        ],
      ),
    );
  }
}
