import 'package:flutter/material.dart';
import 'package:sample/CompaniesVisited.dart';
import 'package:sample/contact.dart';
import 'package:sample/notifications.dart';
import 'package:sample/signup.dart';
import 'package:sample/studentsplaced.dart';

class MyDrawer extends StatelessWidget {
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
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>LogIn()), (Route<dynamic> route) => false);
            },
          )
        ],
      ),
    );
  }
}
