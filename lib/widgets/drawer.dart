

import 'package:flutter/material.dart';
import 'package:placementport/drawer_screens/CompaniesVisited.dart';
import 'package:placementport/drawer_screens/contact.dart';
import 'package:placementport/drawer_screens/notifications.dart';
import 'package:placementport/signin.dart';
import 'package:placementport/drawer_screens/studentsplaced.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_icons/flutter_icons.dart';

FirebaseAuth _auth=FirebaseAuth.instance;

class MyDrawer extends StatelessWidget {
  bool _isadmin;
  String roll;
  String name;
  String branch;


  MyDrawer(this._isadmin,[this.roll,this.name,this.branch]);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: ClipRRect(
            borderRadius: BorderRadius.only(bottomRight:Radius.circular(20),topRight:Radius.circular(20)),
            child:Container(
              color: Colors.white,
              height:MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width*0.7,
          child: Column(
           
            children: [
              Column(
                children: [
                  SizedBox(height:15),
                
              Center(child:Text ("Placement Port",
              style: TextStyle(
                fontSize: 17,
                fontWeight:FontWeight.bold),),),
              SizedBox(height:30),
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0,2.0,12.0,14.0),
                child: Row(
                 
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(image: AssetImage("assets/images/drawer_dp.jpg")),
                        ),
                    ),
                    SizedBox(width:14),
                    Container(
                      child: !_isadmin?Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(roll+" ("+branch+")",
                          style:TextStyle(fontSize:15,fontFamily: 'opensans',fontWeight:FontWeight.w900) 
                          ,),
                          SizedBox(height: 4,),
                          Text(name,style:TextStyle(fontFamily:'opensans')),
                        ],
                      ):
                      Text("Placement Cell Admins"),
                    ),
                  ],
                ),
              ),
              ],
              ),
              Divider(height: 10,color: Colors.grey,),

               ListTile(
                leading: Icon(FlutterIcons.notifications_active_mdi),
                horizontalTitleGap: 0,
                title: Text("Home",style: TextStyle(fontFamily:'opensans')),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              _isadmin?ListTile(
                leading: Icon(FlutterIcons.upload_faw5s),
                horizontalTitleGap: 0,
                title: Text("upload Company",style: TextStyle(fontFamily:'opensans')),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,MaterialPageRoute(builder: (context )=>Notifications()));
                },
              ):Container(height:0,width:0),

               _isadmin?ListTile(
                leading: Icon(FlutterIcons.send_mco),
                horizontalTitleGap: 0,
                title: Text("Send Notification",style: TextStyle(fontFamily:'opensans')),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,MaterialPageRoute(builder: (context )=>Notifications()));
                },
              ):Container(height:0,width:0),

               _isadmin?ListTile(
                leading: Icon(FlutterIcons.upload_ent),
                horizontalTitleGap: 0,
                title: Text("Upload New Students",style: TextStyle(fontFamily:'opensans')),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,MaterialPageRoute(builder: (context )=>Notifications()));
                },
              ):Container(height:0,width:0),

              ListTile(
                leading: Icon(FlutterIcons.notifications_active_mdi),
                horizontalTitleGap: 0,
                title: Text("Notifications",style: TextStyle(fontFamily:'opensans')),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,MaterialPageRoute(builder: (context )=>Notifications()));
                },
              ),
              ListTile(
                leading: Icon(FlutterIcons.business_mdi),
                horizontalTitleGap: 0,
                title: Text("Companies Visited",style: TextStyle(fontFamily:'opensans')),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,MaterialPageRoute(builder: (context )=>CompaniesVisited()));
                },
              ),
              ListTile(
                leading: Icon(FlutterIcons.person_mdi),
                horizontalTitleGap: 0,
                title: Text("Placement stats",style: TextStyle(fontFamily:'opensans')),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,MaterialPageRoute(builder: (context )=>StudentsPlaced()));
                },
              ),
              !_isadmin?ListTile(
                leading: Icon(Icons.phone_android),
                horizontalTitleGap: 0  ,
                title: Text("Contact Us",style: TextStyle(fontFamily:'opensans')),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,MaterialPageRoute(builder: (context )=>Contact()));
                
                },
              ):Container(height:0,width:0),
              Spacer(),
              Divider(height: 4,color: Colors.grey,),
              ListTile(
                leading: Icon(Icons.info),
                horizontalTitleGap: 0,
                title: Text("About App",style: TextStyle(fontFamily:'opensans')),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(FlutterIcons.logout_mco),
                horizontalTitleGap: 0,
                title: Text("LogOut",style: TextStyle(fontFamily:'opensans')),
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>LogIn()), (Route<dynamic> route) => false);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
