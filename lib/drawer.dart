import 'package:flutter/material.dart';
import 'package:sample/contact.dart';
import 'package:sample/notifications.dart';
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
            onTap: () {},
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
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Students Placed"),
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
            
            },
          )
        ],
      ),
    );
  }
}
