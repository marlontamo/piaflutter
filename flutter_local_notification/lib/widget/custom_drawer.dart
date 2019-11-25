import 'package:flutter/material.dart';


class CustomDrawer extends StatefulWidget {
  @override
  CustomDrawerState createState() => CustomDrawerState();
}

class CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(icon: Icons.contacts, text: 'Contacts', onTap: () =>{}),
          _createDrawerItem(icon: Icons.event,text: 'Events',onTap:() => (){}),
          _createDrawerItem(icon: Icons.note, text: 'Notes', onTap:() => (){}),


           Divider(),
          _createDrawerItem(icon: Icons.collections_bookmark,text:'Steps',onTap:()=> (){}),
          _createDrawerItem(icon: Icons.face, text: 'Authors',onTap: ()=>{}),
          _createDrawerItem(icon: Icons.account_box, text: 'Flutter Documentation',onTap: ()=>{}),
          _createDrawerItem(icon: Icons.stars, text: 'Useful Links',onTap: ()=>{}),
          Divider(),
          _createDrawerItem(icon: Icons.bug_report, text: 'Report an issue',onTap: ()=>{}),
          ListTile(
            title: Text('0.0.1'),
            onTap: () {},
          ),
        ]
    )
    );


  }
  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image:  AssetImage('assets/images/header_background.png'))),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("Flutter Step-by-Step",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }
  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
  }


