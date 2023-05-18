import 'package:flutter/material.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Center(child: Text(' go to login Screen'))),
    );
  }
}
