import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:model_class/PushNotification/notificationMange.dart';
import 'package:http/http.dart' as http;

class NotificationPush extends StatefulWidget {
  const NotificationPush({super.key});

  @override
  State<NotificationPush> createState() => _NotificationPushState();
}

class _NotificationPushState extends State<NotificationPush> {
  NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    notificationServices.isTokenRefresh();
    notificationServices.firebaseInit(context);
    notificationServices.requestNotificationPermisson();
    notificationServices.getDeviceToken().then((value) {
      print('device Token');
      print(value);
    });

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade100,
      appBar: AppBar(
        title: Text('Flutter Notification'),
      ),
      body: Center(
        child: TextButton(
            onPressed: () {
              notificationServices.getDeviceToken().then((value) async {
                var data = {
                  'to': value.toString(),
                  'priority': 'high',
                  'notification': {
                  'title': 'Ritesh',
                  'body': 'please subscribe my channel',
                  },
                  'data' :'msg',
                  'id': 'rpn123',
                  


                };
                await http.post(
                    Uri.parse('https://fcm.googleapis.com/fcm/send'),
                    body: jsonEncode(value),
                    headers: {
                      'Content-Type':'application/json; charset=UTF-8',
                      'Authorization':
                          'AAAANOINs9k:APA91bE-BM4-xYd0BnetjAj7y_IeI-3yDIMDb3phDXD4cuE-WnoTiZTGDmAMLI08HwUg-sg7tesrZ4ey6f8c9wKxo2_7g8beHO9wSNSluLCg9_l0qIt0YaLmGFkYLj16T5HJ5BH00y2e',
                    });
              });
            },
            child: Text('Notification Send')),
      ),
    );
  }
}
