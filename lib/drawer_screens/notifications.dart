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
        "As part of the Infosys delivery team, your primary role would be to ensure effective Design, Development, Validation and Support activities, to assure that our clients are satisfied with the high levels of service in the technology domain.",
        "You will gather the requirements and specifications to understand the client requirements in a detailed manner and translate the same into system requirements.",
        "You will play a key role in the overall estimation of work requirements to provide the right information on project estimations to Technology Leads and Project Managers.",
        "You would be a key contributor to building efficient programs/ systems and if you think you fit right in to help our clients navigate their next in their digital transformation journey, this is the place for you!If you think you fit right in to help our clients navigate their next in their digital transformation journey, this is the place..."
      ],
      "30-12-2021",
      true),
  Companies(
      "Wipro",
      [
        "As part of the Infosys delivery team, your primary role would be to ensure effective Design, Development, Validation and Support activities, to assure that our clients are satisfied with the high levels of service in the technology domain.",
        "You will gather the requirements and specifications to understand the client requirements in a detailed manner and translate the same into system requirements.",
        "You will play a key role in the overall estimation of work requirements to provide the right information on project estimations to Technology Leads and Project Managers.",
        "You would be a key contributor to building efficient programs/ systems and if you think you fit right in to help our clients navigate their next in their digital transformation journey, this is the place for you!If you think you fit right in to help our clients navigate their next in their digital transformation journey, this is the place..."
      ],
      "30-12-2022",
      true),
  Companies(
      "Cognizant",
      [
        "As part of the Infosys delivery team, your primary role would be to ensure effective Design, Development, Validation and Support activities, to assure that our clients are satisfied with the high levels of service in the technology domain.",
        "You will gather the requirements and specifications to understand the client requirements in a detailed manner and translate the same into system requirements.",
        "You will play a key role in the overall estimation of work requirements to provide the right information on project estimations to Technology Leads and Project Managers.",
        "You would be a key contributor to building efficient programs/ systems and if you think you fit right in to help our clients navigate their next in their digital transformation journey, this is the place for you!If you think you fit right in to help our clients navigate their next in their digital transformation journey, this is the place..."
      ],
      "31-12-2023",
      true),
  Companies(
      "Yahoo",
      [
        "As part of the Infosys delivery team, your primary role would be to ensure effective Design, Development, Validation and Support activities, to assure that our clients are satisfied with the high levels of service in the technology domain.",
        "You will gather the requirements and specifications to understand the client requirements in a detailed manner and translate the same into system requirements.",
        "You will play a key role in the overall estimation of work requirements to provide the right information on project estimations to Technology Leads and Project Managers.",
        "You would be a key contributor to building efficient programs/ systems and if you think you fit right in to help our clients navigate their next in their digital transformation journey, this is the place for you!If you think you fit right in to help our clients navigate their next in their digital transformation journey, this is the place..."
      ],
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
