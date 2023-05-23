import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class homePostman extends StatefulWidget {
  const homePostman({super.key});

  @override
  State<homePostman> createState() => _homeState();
}

class _homeState extends State<homePostman> {
  @override
  void initState() {
    super.initState();
    

    // this method call when app in terminated state and you get a notification
    // when you clk on notification app from terminated state and you can get notification data in this
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      print("FirebaseMessaging.instance.getInitialMessage");
      if(message != null){
        print('new Notification');
      }
    });

   // this method is only call when app is foreground it mean be open
    FirebaseMessaging.onMessage.listen((message) {
      print('FirebaseMessaging.onMessage.listen');
      if (message.notification != null){
        print(message.notification!.title);
        print(message.notification!.body);
        print("message.detail ${message.data}");
      }
    });
// this message only call when app in background and not terminated (not close)
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print('FirebaseMessaging.onMessageOpenedApp.listen');
      if(message.notification != null){
        print(message.notification!.title);
        print(message.notification!.body);
        print("message.data2 ${message.data['_id']}");
      }
      
    });
    
  }
    


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification App'),
      ),
      body: Center(
        child: 
        Text("Concept of push notificaton"),
      ),
    );
  }
}