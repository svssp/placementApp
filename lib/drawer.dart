import 'package:flutter/material.dart';
import 'package:placementport/CompaniesVisited.dart';
import 'package:placementport/contact.dart';
import 'package:placementport/notifications.dart';
import 'package:placementport/signup.dart';
import 'package:placementport/studentsplaced.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth _auth=FirebaseAuth.instance;

class MyDrawer extends StatelessWidget {
  bool _isadmin;
  MyDrawer(this._isadmin);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(0),
        children: [
          DrawerHeader(
            child: Text(
              "Placementcell SVUCE",
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () {
              Navigator.pop(context);
            },
          ),

          _isadmin?ListTile(
            leading: Icon(Icons.notifications),
            title: Text("upload Company"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,MaterialPageRoute(builder: (context )=>Notifications()));
            },
          ):Container(height:0,width:0),

           _isadmin?ListTile(
            leading: Icon(Icons.notifications),
            title: Text("Send Notification"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,MaterialPageRoute(builder: (context )=>Notifications()));
            },
          ):Container(height:0,width:0),

           _isadmin?ListTile(
            leading: Icon(Icons.notifications),
            title: Text("Upload New Students"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,MaterialPageRoute(builder: (context )=>Notifications()));
            },
          ):Container(height:0,width:0),

          ListTile(
            leading: Icon(Icons.notifications),
            title: Text("Notifications"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,MaterialPageRoute(builder: (context )=>Notifications()));
            },
          ),
          ListTile(
            leading: Icon(Icons.business_center),
            title: Text("Companies Visited"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,MaterialPageRoute(builder: (context )=>CompaniesVisited()));
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Placement stats"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,MaterialPageRoute(builder: (context )=>StudentsPlaced()));
            },
          ),
          ListTile(
            leading: Icon(Icons.phone_android),
            title: Text("Contact Us"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,MaterialPageRoute(builder: (context )=>Contact()));
            
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("LogOut"),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>LogIn()), (Route<dynamic> route) => false);
            },
          )
        ],
      ),
    );
  }
}
