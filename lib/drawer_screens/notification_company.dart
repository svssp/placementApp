import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:placementport/drawer_screens/CompaniesVisited.dart';

class Company extends StatefulWidget {
  String name;
  List<String> ec;
  String date; //eligibility criteria
  Company(this.name, this.ec, this.date);
  @override
  _CompanyState createState() => _CompanyState(name, ec, date);
}

class _CompanyState extends State<Company> {
  String name;
  List<String> ec;
  String date;
  _CompanyState(this.name, this.ec, this.date);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.white,
          fontFamily: 'inter',
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          )),
      home: Scaffold(
        backgroundColor: Color(0xFFF5F7FB),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(name),
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black),
                            image: DecorationImage(
                              image: AssetImage("assets/images/infosys.png"),
                              fit: BoxFit.fill,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size(20, 10),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text("Apply Now",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16)),
                        autofocus: false,
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Eligibility Criteria",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'opensans',
                        fontSize: 20,
                      ),
                    ),
                    Container(
                      child: Divider(
                        color: Colors.grey,
                      ),
                      width: 140,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ] +
                  ec
                      .map((e) => Container(
                            margin: EdgeInsets.symmetric(horizontal: 15)
                                .copyWith(bottom: 15),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text((ec.indexOf(e) + 1).toString() + ") "),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Text(e,
                                      style: TextStyle(
                                        fontFamily: 'opensans',
                                        fontWeight: FontWeight.w300,
                                        height: 1.4,
                                        fontSize: 15,
                                      )),
                                ),
                              ],
                            ),
                          ))
                      .toList() +
                  [
                    SizedBox(
                      height: 13,
                    ),
                    Text.rich(TextSpan(children: [
                      TextSpan(
                        text: "Last Date To Apply: ",
                        style:
                            TextStyle(fontSize: 15.0, fontFamily: 'quicksand'),
                      ),
                      TextSpan(
                        text: date,
                        style: TextStyle(
                          color: Colors.red[700],
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ])),
                  ],
            ),
          ),
        ),
      ),
    );
  }
}
