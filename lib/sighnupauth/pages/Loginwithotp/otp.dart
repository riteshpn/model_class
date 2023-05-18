import 'package:flutter/material.dart';

class PhoneOtpVerfication extends StatefulWidget {
  const PhoneOtpVerfication({Key? key}) : super(key: key);

  @override
  State<PhoneOtpVerfication> createState() => _PhoneOtpVerficationState();
}

class _PhoneOtpVerficationState extends State<PhoneOtpVerfication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        title: Text('sign up with Google'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: ElevatedButton(
                  onPressed: () {}, child: Text('SignUp with Google')))
        ],
      ),
    );
  }
}
