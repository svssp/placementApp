import 'package:flutter/material.dart';
import 'package:sample/drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Placement Port",
      home: new Scaffold(
          appBar: new AppBar(
            title: new Text("Placement Cell"),
          ),
          body: Center(
            child: new Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              child: Text(
                "currently no companies are available...",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ),
          ),
          drawer: MyDrawer()),
    );
  }
}
