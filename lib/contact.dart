import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Contact Us",
      home: new Scaffold(
        appBar: new AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: ()=>Navigator.of(context).pop(),
          ),
          title: new Text("Contact"),
        ),
        body: new Padding(
          padding: EdgeInsets.fromLTRB(30, 20, 20, 0),
          child: Row(),
        ),
      ),
    );
  }
}
