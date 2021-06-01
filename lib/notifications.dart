import 'package:flutter/material.dart';

List<List<String>>s=[["Infosys","Eligibility Criteria like grade points or Attendance to apply for the company Comes here","31-12-2019"],
["Infosys","Eligibility Criteria like grade points or Attendance to apply for the company Comes here","31-12-2019"],
["Infosys","Eligibility Criteria like grade points or Attendance to apply for the company Comes here","31-12-2019"],
["Infosys","Eligibility Criteria like grade points or Attendance to apply for the company Comes here","31-12-2019"]];

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       theme:ThemeData(
        
    primaryColor: Colors.white,
    fontFamily: 'inter',
    textTheme: TextTheme(
      headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      )),


      title: "Notifications",

      home: new Scaffold(


        appBar: new AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: ()=>Navigator.of(context).pop(),
          ),
          title: new Text("Notifications"),
          centerTitle: true,
          elevation: 0,
        ),

        body: SingleChildScrollView(
          child: Container(
            child:Column(
              children: s.map(
                (company) => Container(
                  decoration: BoxDecoration(
                        border:Border(bottom: BorderSide(width:1.0,color:Colors.grey),/*top:BorderSide(width:1.0,color:Colors.grey)*/)
                      ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12.0, 5.0, 0.0, 6.0),
                    child: Container(
                      width: double.infinity,
                      
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(company[0],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          )
                          ),
                          SizedBox(height:8),
                          Text("Eligibility Criteria :",style: TextStyle(
                            fontWeight:FontWeight.bold,
                            fontSize: 17.0,
                            ),
                            ),
                          SizedBox(height:4),
                          Text(company[1],style: TextStyle(
                            fontSize: 16.0,
                            ),),
                          SizedBox(height:8),
                          Text("Last Date For Application : "+company[2],
                          style: TextStyle(fontSize: 15.0),
                          ),
                          Divider(height:20,color: Colors.grey[350]),
                          Align(
                            alignment: Alignment.centerRight,
                              child: TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size(20, 10),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                ),
                              child: Text("Apply now >>>",textAlign: TextAlign.right,),
                              autofocus: false,
                              onPressed: (){},
                              ),
                          ),
                        ],),
                    ),
                  ),
                )).toList(),
            ),
          ),
          ),

      ),
    );
  }
}