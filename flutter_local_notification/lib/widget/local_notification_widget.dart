import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//import 'package:flutter_local_notification/page/notification_page.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//import 'package:flutter_local_notification/page/second_page.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notification/local_notifications_helper.dart';
class LocalNotificationWidget extends StatefulWidget {
  @override
  _LocalNotificationWidgetState createState() =>
      _LocalNotificationWidgetState();
}

class _LocalNotificationWidgetState extends State<LocalNotificationWidget> {
  final notifications = FlutterLocalNotificationsPlugin();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  String textValue, notitle, notbody;
  @override
  void initState() {
    super.initState();

    final settingsAndroid = AndroidInitializationSettings('ic_launcher');
    final settingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) =>
            onSelectNotification(payload),
        );

    notifications.initialize(
        InitializationSettings(settingsAndroid, settingsIOS),
        onSelectNotification: onSelectNotification);
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        this.notitle = message['notification']['title'];
        this.notbody = message ['notification']['body'];

        showOngoingNotification(notifications,title:notitle,body:notbody);
        print("onMessage: $message");
        },
      onLaunch: (Map<String, dynamic> message) async {


        print("onLaunch: $message");
        },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        },
    );
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(
            sound: true,
            alert: true,
            badge: true
        )
    );
    _firebaseMessaging.onIosSettingsRegistered.listen((IosNotificationSettings setting){
      print("IOSSetting Registered");
    });
    _firebaseMessaging.getToken().then((token){
      this.textValue = token;
      debugPrint("TOKEN: $textValue");

      setState((){

      });
    });

  }

  Future onSelectNotification( payload) async => await nyare();



  void<String> nyare() {

    print("natanggap ko na po ang mensahe");
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("test"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text("test flutter local with firebase"),
      ),
    );
  }

}
