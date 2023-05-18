import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class update extends StatefulWidget {
  const update({super.key});

  @override
  State<update> createState() => _readState();
}

class _readState extends State<update> {
  getdata() async {
    var result = await FirebaseFirestore.instance.collection("Student").get();
    return result;
  }

  updatedata(id, value) async {
    await FirebaseFirestore.instance
        .collection('Student')
        .doc(id)
        .update({'name': value});
  }

  deleteitem(id) async {
    await FirebaseFirestore.instance.collection('Student').doc(id).delete();
  }

  String updatename ="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      body: FutureBuilder(
        future: getdata(),
        builder: (context, dynamic snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: GestureDetector(
                      onTap: () {
                        Get.defaultDialog(
                            content: TextField(
                              onChanged: (value) {
                                setState(() {
                                  updatename = value;
                                });
                              },
                            ),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      updatedata(snapshot.data.docs[index].id,
                                          updatename);
                                    });
                                  },
                                  child: Text('UPDATE'))
                            ]);
                      },
                      child: Icon(Icons.check_circle)),
                  title: Text(
                    "${snapshot.data.docs[index]['name']}",
                  ),
                  subtitle: Text(
                    "${snapshot.data.docs[index].id}",
                  ),
                  trailing: GestureDetector(
                      onTap: () {
                        deleteitem(snapshot.data.docs[index].id);
                        setState(() {});
                      },
                      child: Icon(
                        Icons.delete,
                        color: Colors.red,
                      )),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
