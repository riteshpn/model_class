import 'package:app_settings/app_settings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

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

  void firebaseInit(){
    FirebaseMessaging.onMessage.listen((messeage) {
      print(messeage.notification.title.toString());
      print(messeage.notification.body.toString());
      
    });
  }

  Future<String> getDeviceToken()async{
        String? token =await messaging.getToken();
        return token!;

      }
  void isTokenRefresh(){
    messaging.onTokenRefresh.listen((event) {event.toString();});
  }
}
