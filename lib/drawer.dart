

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
  String roll;
  String name;
  MyDrawer(this._isadmin,[this.roll,this.name]);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(0),
        children: [
          SizedBox(height:30),
          Center(child:Text ("Placement Cell SVUCE",
          style: TextStyle(
            fontSize: 17,
            fontWeight:FontWeight.bold),),),
          SizedBox(height:30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage("assets/images/download.jpeg")),
                  ),
              ),
              Container(
                child: !_isadmin?Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(roll,
                    style:TextStyle(color: Colors.black,fontSize:15,fontFamily: 'opensans',fontWeight:FontWeight.bold) 
                    ,),
                    SizedBox(height: 14,),
                    Text(name,style:TextStyle(color:Colors.black,fontFamily:'opensans')),
                  ],
                ):
                Text("Placement Cell Admins"),
              ),
            ],
          ),
          SizedBox(height:10),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home",style: TextStyle(fontFamily:'opensans'),),
            onTap: () {
              Navigator.pop(context);
            },
          ),

          _isadmin?ListTile(
            leading: Icon(Icons.notifications),
            title: Text("upload Company",style: TextStyle(fontFamily:'opensans')),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,MaterialPageRoute(builder: (context )=>Notifications()));
            },
          ):Container(height:0,width:0),

           _isadmin?ListTile(
            leading: Icon(Icons.notifications),
            title: Text("Send Notification",style: TextStyle(fontFamily:'opensans')),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,MaterialPageRoute(builder: (context )=>Notifications()));
            },
          ):Container(height:0,width:0),

           _isadmin?ListTile(
            leading: Icon(Icons.notifications),
            title: Text("Upload New Students",style: TextStyle(fontFamily:'opensans')),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,MaterialPageRoute(builder: (context )=>Notifications()));
            },
          ):Container(height:0,width:0),

          ListTile(
            leading: Icon(Icons.notifications),
            title: Text("Notifications",style: TextStyle(fontFamily:'opensans')),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,MaterialPageRoute(builder: (context )=>Notifications()));
            },
          ),
          ListTile(
            leading: Icon(Icons.business_center),
            title: Text("Companies Visited",style: TextStyle(fontFamily:'opensans')),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,MaterialPageRoute(builder: (context )=>CompaniesVisited()));
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Placement stats",style: TextStyle(fontFamily:'opensans')),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,MaterialPageRoute(builder: (context )=>StudentsPlaced()));
            },
          ),
          !_isadmin?ListTile(
            leading: Icon(Icons.phone_android),
            title: Text("Contact Us",style: TextStyle(fontFamily:'opensans')),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,MaterialPageRoute(builder: (context )=>Contact()));
            
            },
          ):Container(height:0,width:0),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("LogOut",style: TextStyle(fontFamily:'opensans')),
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
