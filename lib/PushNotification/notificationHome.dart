import 'package:flutter/material.dart';
import 'package:model_class/PushNotification/notificationMange.dart';

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
    notificationServices.requestNotificationPermisson();
    notificationServices.getDeviceToken().then((value) {
      print('device Token');
      print(value);
    });

    super.initState();
  }

  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.amber.shade100,
    );
  }
}
