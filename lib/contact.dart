import 'package:flutter/material.dart';

List<String>PlacementCell=[
  "Dr.Vivekanandha Reddy",
  "P.Rakesh",
  "V.Madhuri",
  "K.Surya",
  "SVSSP"
];

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData(
        
    primaryColor: Colors.white,

    // Define the default font family.
    fontFamily: 'inter',

    // Define the default TextTheme. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and more.
    textTheme: TextTheme(
      headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      )),
      title: "Contact Placement Cell",
      home: new Scaffold(
        appBar: new AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: ()=>Navigator.of(context).pop(),
          ),
          title: new Text("Contact"),
          centerTitle: true,
          elevation: 0,
        ),


        body: new Padding(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: SingleChildScrollView(
                      child: Column(
              children:PlacementCell.map(
                (item)=>Container(
                  width: double.infinity,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 0,vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                        color: Colors.black38,
                        offset: const Offset(
                          3.0,
                          3.0,
                        ),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ),
                      BoxShadow(
                        color: Colors.white,
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ),
                      ]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Text(item,
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                          ),
                          SizedBox(height:10),
                          Text("Placement Cell"),
                          Divider(height:20,color: Colors.black45,),
                          TextButton(child: Text("call",),autofocus: false,onPressed: (){},style: TextButton.styleFrom(padding:EdgeInsets.zero,alignment:Alignment.centerLeft),),
                        ]
                      ),
                    ),
                  ),
                )
              ).toList(),
              ),
          ),
        ),

      ),
    );

  }
}
