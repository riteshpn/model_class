// ignore: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

signUpUser(String userName, String userEmail, String userPassword,
    String userHomeAddress, String userPhoneNumber) async {
  User? userid = FirebaseAuth.instance.currentUser;

  try {
    await FirebaseFirestore.instance.collection('users').doc(userid!.uid).set({
      'userName': userName,
      'userPhone': userPhoneNumber,
      'userEmail': userEmail,
      'useraddress': userHomeAddress,
      'createdAt': DateTime.now(),
      'UID': userid.uid,
    }).then((value) => {
          FirebaseAuth.instance.signOut(),
        });
  } on FirebaseAuthException catch (e) {
    print('Error $e');
  }
}
