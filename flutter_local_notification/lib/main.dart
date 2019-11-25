import 'package:flutter/material.dart';
import 'package:flutter_local_notification/widget/custom_drawer.dart';
import 'package:flutter_local_notification/widget/local_notification_widget.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}
  class MyApp extends StatelessWidget {

  final flutterWebviewPlugin = new FlutterWebviewPlugin();
  final String appTitle = '';

  @override
  Widget build(BuildContext context) =>
  MaterialApp(
  title: appTitle,
  home: MainPage(appTitle: appTitle),
  );
  }

  class MainPage extends StatelessWidget {
  final String appTitle;

  const MainPage({this.appTitle});


  Widget build(BuildContext context) => Scaffold(

    appBar: AppBar(
  title: Text(appTitle),
  ),

  body:LocalNotificationWidget(),
    drawer: new CustomDrawer(),






    );



  }


