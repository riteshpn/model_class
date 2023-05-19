import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  final String id;
 

  const MessageScreen(
      {super.key,
      required this.id,
      });

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Message Screen' + widget.id,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Text(
            widget.id,
            style: TextStyle(fontSize: 20),
          ),
         
        ],
      ),
    );
  }
}
