import 'dart:core';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notification/local_notifications_helper.dart';
import 'package:http/http.dart'as http;
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'custom_drawer.dart';
class LocalNotificationWidget extends StatefulWidget {
  @override
  _LocalNotificationWidgetState createState() =>
      _LocalNotificationWidgetState();
}

class _LocalNotificationWidgetState extends State<LocalNotificationWidget> {
  final notifications = FlutterLocalNotificationsPlugin();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final flutterWebviewPlugin = new FlutterWebviewPlugin();
   String textValue, notitle, notbody;
   int messageId;
  String osType;
  String inputtype= "hidden";
  Future onSelectNotification(payload) async => await natanggapMoNaBa();
  @override
  void initState() {
    super.initState();
    // injecting javascript on webpage
    flutterWebviewPlugin.onStateChanged.listen(( state) async {
      assert(state != null);


      if (state.type == WebViewState.finishLoad) {
        //print("token: " + textValue + " ");
        String toKen = 'var theForm = document.forms["form1"];';
        toKen += 'var input =document.createElement("input");';
        toKen += 'input.type = "$inputtype";';
        toKen += 'input.className = "form-control";';
        toKen += 'input.name ="fcmToken";';
        toKen += "input.value ='$textValue';";
        toKen += 'theForm.appendChild(input);';
        flutterWebviewPlugin.evalJavascript(toKen);
        String oS = 'var theForm = document.forms["form1"];';
        oS += 'var inputOS =document.createElement("input");';
        oS += 'inputOS.type = "$inputtype";';
        oS += 'inputOS.className = "form-control";';
        oS += 'inputOS.name ="OS-Type";';
        if (Platform.isAndroid) {
          osType = "Android";
          oS += "inputOS.value ='$osType';";
        } else {
          osType = "IOS";
          oS += "inputOS.value ='$osType';";
        }
        oS += 'theForm.appendChild(inputOS);';
        flutterWebviewPlugin.evalJavascript(oS);
      } //finishloading
    });

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
        //this.message_id =message['data']['message_id'];
        this.notitle = message['notification']['title'];
        this.notbody = message ['notification']['body'];
        print(message);

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


    @override
    void dispose() {
      flutterWebviewPlugin.dispose();
      super.dispose();
    }
  }



  Future natanggapMoNaBa()async{
    //dto natin gawin yung pag update sa database
    var url = 'https://killaudiov1.000webhostapp.com/testdrive/welcome/lite';
    var response = await http.post(url, body: {'submit':'submit','title': '$notitle', 'body': '$notbody','status':'R'});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');


   // print("ok na pwede na natin i-save sa database");
  }
//  Navigator.push(
//    context,
//    MaterialPageRoute(builder: (context) => SecondPage(payload: payload, title: notitle,body: notbody,)),
//  );

  @override
  Widget build(BuildContext context) {

     return new MaterialApp(

      routes: {
        "/": (_) =>

        new WebviewScaffold(

          url: "http://pinesportal.com:8080/appl/com/login/student",
          withJavascript: true,
          appBar:AppBar(
            title: new Text("Pines International Academy"),
          ),
        ),



      }
      );
  }
}

