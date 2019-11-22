import 'package:flutter/material.dart';
import 'package:flutter_local_notification/widget/local_notification_widget.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final flutterWebviewPlugin = new FlutterWebviewPlugin();
  final String appTitle = 'Local Notifications';
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: appTitle,
    home: MainPage(appTitle: appTitle),
  );
}

class MainPage extends StatelessWidget {
  final String appTitle;

  const MainPage({this.appTitle});
//  @override
//  Widget build(BuildContext context) {
//
//    return new MaterialApp(
//    routes: {
//    "/": (_) =>new WebviewScaffold(
//    url: "http://pinesportal.com:8080/appl/com/login/student",
//    withJavascript: true,
//    appBar: new AppBar(
//    title: new Text("Pines International Academy"),
//    ),
//    ),
//    },
//    );
//  }
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(appTitle),
    ),
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: LocalNotificationWidget(),
    ),
  );
}