import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

// ignore: must_be_immutable
class SecondPage extends StatelessWidget {

  final flutterWebviewPlugin = new FlutterWebviewPlugin();
   String payload, title, body;

   SecondPage({
     @required this.payload,
    @required this.title,
    @required this.body,
    Key key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.black,
    body: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget>[
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              backgroundColor: Colors.purple
            ),

          ),
          const SizedBox(height: 3,
          child: const DecoratedBox(
            decoration: const BoxDecoration(
              color: Colors.green
              )
            ),
          ),

          Text(
            body,
            style:TextStyle(
              color: Colors.white,
              backgroundColor: Colors.green,
            ),
          ),
          const SizedBox(height: 3),
          RaisedButton(
            child: Text('ok'),
            onPressed:(){
               print("save data to db");
               Navigator.pop(context);
            },
          ),
        ]
    )
  )
  );
//


}