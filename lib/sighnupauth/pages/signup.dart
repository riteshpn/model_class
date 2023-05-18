import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model_class/sighnupauth/pages/Login.dart';
import 'package:model_class/sighnupauth/pages/screens/services/SighnUpservices.dart';

class SighnUpPage extends StatefulWidget {
  const SighnUpPage({super.key});

  @override
  State<SighnUpPage> createState() => _SighnUpPageState();
}

class _SighnUpPageState extends State<SighnUpPage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();
  TextEditingController userHomeAddressController = TextEditingController();
  TextEditingController userPhoneController = TextEditingController();

  User? CurrentUser = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Welcome To Signup'),
        actions: const [Icon(Icons.more_vert_rounded)],
      ),
      body: SingleChildScrollView(
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
                controller: userNameController,
                decoration: InputDecoration(
                  hintText: 'Name',
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
                controller: userEmailController,
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
                controller: userPasswordController,
                decoration: InputDecoration(
                  hintText: 'Password',
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
                controller: userHomeAddressController,
                decoration: InputDecoration(
                  hintText: 'HomeAddress',
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
                controller: userPhoneController,
                decoration: InputDecoration(
                  hintText: 'Phone Number',
                  enabledBorder: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                var userName = userNameController.text.trim();
                var userEmail = userEmailController.text.trim();
                var userPassword = userPasswordController.text.trim();
                var userHomeAddress = userHomeAddressController.text.trim();
                var userPhoneNumber = userPhoneController.text.trim();

                await FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                        email: userEmail, password: userPassword)
                    .then((value) => {
                          log('User Created'),
                          signUpUser(userName, userEmail, userPassword,
                              userHomeAddress, userPhoneNumber),
                        });
              },
              child: const Text('SignUp'),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => login_screen()));
              },
              child: Container(
                child: const Card(
                    child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text('Already have an account SignIn'),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
