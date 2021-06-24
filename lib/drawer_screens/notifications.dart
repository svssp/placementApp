import 'package:flutter/material.dart';
import 'package:placementport/drawer_screens/notification_company.dart';
import 'package:placementport/widgets/fade_animation.dart';

class Companies {
  String name;
  List<String> eligibility;
  String date;
  bool ongoing;

  Companies(this.name, this.eligibility, this.date, this.ongoing);
}

final colors = [
  [Colors.teal[200], Colors.cyan[400]],
  [Colors.blue[100], Colors.grey[350]]
];

final text_colors = [
  Colors.white,
  Colors.black87,
];

List<Companies> s = [
  Companies(
      "Infosys",
      [
        "Candidate Should be Human",
        "Canditate should eat both veg and non-veg"
      ],
      "30-12-2021",
      true),
  Companies(
      "Wipro",
      ["Candidate Should be Alien", "Canditate must donate an UFO to company"],
      "30-12-2022",
      true),
  Companies(
      "Cognizant",
      ["Candidate Should be from China", "Canditate should eat Aliens also"],
      "31-12-2023",
      true),
  Companies(
      "Yahoo",
      ["Candidate Should be yoho", "Canditate must wear goggles"],
      "10-22-2021",
      false),
];

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.white,
          fontFamily: 'inter',
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          )),
      title: "Notifications",
      home: new Scaffold(
        appBar: new AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: new Text(
            "Notifications",
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Color(0xFFF5F7FB),
            child: Column(
              children: s
                  .map((company) => FadeAnimation(
                        delay: 0.9 + 0.2 * s.indexOf(company),
                        xDistance: 0,
                        yDistance: 40,
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Colors.white,
                          ),
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(
                                25.0, 10.0, 10.0, 5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    constraints: BoxConstraints(
                                      minWidth: 200,
                                    ),
                                    width:
                                        (20 * company.name.length).toDouble(),
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.blue[600],
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(120),
                                            bottomRight: Radius.circular(120))),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        company.name.toUpperCase(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20.0,
                                            color: Colors.white,
                                            fontFamily: 'quicksand'),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 15),
                                Text(
                                  "Estimated Package : 3.6LPA-4.8LPA",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17.0,
                                      fontFamily: 'quicksand'),
                                ),
                                SizedBox(height: 8),
                                Text.rich(TextSpan(children: [
                                  TextSpan(
                                    text: "Last Date To Apply: ",
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontFamily: 'quicksand'),
                                  ),
                                  TextSpan(
                                    text: company.date,
                                    style: TextStyle(
                                      color: Colors.red[700],
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ])),
                                Divider(height: 30, color: Colors.white54),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          company.ongoing
                                              ? "ONGOING"
                                              : "EXPIRED",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(width: 6),
                                        Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: company.ongoing
                                                ? Colors.greenAccent[400]
                                                : Colors.redAccent[200],
                                          ),
                                          height: 13,
                                          width: 13,
                                        ),
                                      ],
                                    ),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                        minimumSize: Size(20, 10),
                                        tapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                      ),
                                      child: Text(
                                        "More Details >>",
                                        textAlign: TextAlign.right,
                                      ),
                                      autofocus: false,
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Company(
                                                    company.name,
                                                    company.eligibility,
                                                    company.date)));
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
