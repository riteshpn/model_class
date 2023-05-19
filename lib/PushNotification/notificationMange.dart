import 'dart:math';

import 'package:app_settings/app_settings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:model_class/PushNotification/MessageCReen.dart';

class NotificationServices {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void requestNotificationPermisson() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      provisional: true,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('user granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('user granted permission');
    } else {
      AppSettings.openNotificationSettings();
      print('user granted permission');
    }
  }

  void initLocalNotification(
      BuildContext context, RemoteMessage message) async {
    var androidIntializationSettings =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings = InitializationSettings(
      android: androidIntializationSettings,
    );
    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (payload) {
         if (message.data['type'] == 'msg'){
          Navigator.push(context, MaterialPageRoute(builder: (context) => MessageScreen(),));
        }
        
      
        
      },
    );
    //  //new add
    //  _flutterLocalNotificationsPlugin
    //     .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
    //     ?.requestPermission();
  }

  void firebaseInit(BuildContext context) {
    FirebaseMessaging.onMessage.listen((messege) {
      if (kDebugMode) {
        print(messege.notification!.title.toString());
        print(messege.notification!.body.toString());
        print(messege.data.toString());
        print(messege.data['type'].toString());
        print(messege.data['id'].toString());


      }
      initLocalNotification(context, messege);
      showNotification(messege);
    });
  }

  Future<void> showNotification(RemoteMessage message) async {
    AndroidNotificationChannel channel = AndroidNotificationChannel(
        Random.secure().nextInt(100000).toString(),
        'Hi you have recevied copl notification',
        importance: Importance.max);
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('popop', 
           'fgfgfg',
            channelDescription: 'Hi you have recevied copl notification',
            importance: Importance.high,
            priority: Priority.high,
            ticker: 'ticker');

    DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: darwinNotificationDetails);

    Future.delayed(
      Duration.zero,
      () {
        _flutterLocalNotificationsPlugin.show(
            1,
            message.notification!.title.toString(),
            message.notification!.body.toString(),
            notificationDetails);
      },
    );

    Future.delayed(Duration.zero, () {
      _flutterLocalNotificationsPlugin.show(
          0,
          message.notification!.title.toString(),
          message.notification!.body.toString(),
          notificationDetails);
    });
  }

  //    },
  //    _flutterLocalNotificationsPlugin.show(
  //    0,
  //      message.notification!.title.toString();
  //      message.notification!.body.toString();
  //     notificationDetails))

  //  }

  Future<String> getDeviceToken() async {
    String? token = await messaging.getToken();
    return token!;
  }

  void isTokenRefresh() {
    messaging.onTokenRefresh.listen((event) {
      event.toString();
    });

    void handleMessages(
      BuildContext context, RemoteMessage message){
       

    }
  }
}
