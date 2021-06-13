import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:placementport/drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final List<String> imagesList = [
  'assets/images/placement1.png',
  'assets/images/placement2.jpg',
  'assets/images/placement3.jpeg'
];

FirebaseFirestore _firestore=FirebaseFirestore.instance;

class HomePage extends StatefulWidget {

  String email;
  HomePage(this.email);

  @override
  _HomePageState createState() => _HomePageState(email);
}

class _HomePageState extends State<HomePage> {

  bool _isadmin=false;
  String email;

  _HomePageState(this.email);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       theme:ThemeData(
          
      primaryColor: Colors.white,
      fontFamily: 'inter',

      textTheme: TextTheme(
        headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'inter'),
        )),

        home: IntroBuilder(email),
    );
  }
}

class IntroBuilder extends StatefulWidget {
  var email;
  IntroBuilder(this.email);
  @override
  _IntroBuilderState createState() => _IntroBuilderState(email);
}

class _IntroBuilderState extends State<IntroBuilder> {

  var email;
  _IntroBuilderState(this.email);
  CollectionReference _user=_firestore.collection("users");
  var _currentIndex;
  bool _isadmin=false;
  String name;
  String roll;
  String branch;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(

        future: _user.doc(email).get(),
        builder:(context,snapshot)
        {
          if(snapshot.hasError)
          return Text("Error while Loading, Check Your Data Connection....");
          if (snapshot.hasData) {
          var data = snapshot.data.data();
          _isadmin=data['isAdmin'];
          if(!_isadmin)
          {
            name=data['name'];
            roll=data['rollnum'];
            branch=data['branch'];
          }
          return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white70,
            title: Text('Placement Port'),
            elevation: 0,
            centerTitle: true,
          ),
          body: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  // enlargeCenterPage: true,
                  //scrollDirection: Axis.vertical,
                  onPageChanged: (index, reason) {
                    setState(
                      () {
                        _currentIndex = index;
                      },
                    );
                  },
                ),
                items: imagesList
                    .map(
                      (item) => Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Card(
                          margin: EdgeInsets.only(
                            top: 10.0,
                            bottom: 5.0,
                          ),
                          elevation: 3.0,
                          shadowColor: Colors.black38,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                            child: Image.asset(
                              item,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imagesList.map((urlOfItem) {
                  int index = imagesList.indexOf(urlOfItem);
                  return Container(
                    width: 6.0,
                    height: 6.0,
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == index
                          ? Color.fromRGBO(0, 0, 0, 0.8)
                          : Color.fromRGBO(0, 0, 0, 0.3),
                    ),
                  );
                }).toList(),
              )
            ],
            
          ),
          drawer: _isadmin?MyDrawer(_isadmin):MyDrawer(_isadmin,roll=roll,name=name) 
      );
        }
          return Scaffold(
                      body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  CircularProgressIndicator(),
                  
                ]
              )
            ),
          );
        }
    );
  }
}
