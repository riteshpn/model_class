import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Insert extends StatefulWidget {
  const Insert({super.key});

  @override
  State<Insert> createState() => _InsertState();
}

class _InsertState extends State<Insert> {
  adddata(
    value,
  ) async {
    await FirebaseFirestore.instance.collection('Student').add({
      'name': value,
    });
  }

  String name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'name',
                hintText: 'Enter ur Name',
              ),
            ),
          ),
          SizedBox(
            height: 32,
          ),
          ElevatedButton(
              onPressed: () {
                adddata(
                  name,
                );
              },
              child: Text('add data'))
        ],
      ),
    );
  }
}
