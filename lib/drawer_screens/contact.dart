import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:placementport/widgets/fade_animation.dart';
import 'package:url_launcher/url_launcher.dart';

Map<String, dynamic> PlacementCell = {
  "Dr.Vivekanandha Reddy": {
    "Position": "Placement Co ordinator",
    "Phone": "+919441005225"
  },
  "Sri Murali": {
    "Position": "Placement Co ordinator ",
    "Phone": "+919441005225"
  },
  "Siva": {"Position": "Placement Incharge", "Phone": "+919441005225"},
};

class ContactCard extends StatelessWidget {
  String icon;
  String name;
  String sub;
  String phone;
  ContactCard(this.icon, this.name, this.sub, this.phone);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF5F7FB),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 10, 12, 10),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage("assets/images/download.jpeg")),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      sub,
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Icon(Icons.email_outlined),
            )
          ],
        ),
      ),
    );
  }
}

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.white,
          fontFamily: 'inter',
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          )),
      title: "Contact Placement Cell",
      home: new Scaffold(
        appBar: new AppBar(
          backgroundColor: Color(0xFFF5F7FB),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: new Text("Contact",
              style: TextStyle(fontWeight: FontWeight.bold)),
          elevation: 0,
        ),
        body: Container(
          height: double.infinity,
          color: Color(0xFFF5F7FB),
          child: SingleChildScrollView(
            child: Column(
              children: List.generate(
                PlacementCell.length,
                (index) => Column(
                  children: [
                    FadeAnimation(
                      yDistance: 50,
                      delay: 0.8 + index * 0.2,
                      xDistance: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 12),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 12),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          children: [
                            ListTile(
                              subtitle: Text(
                                  "${PlacementCell.values.elementAt(index)["Position"]}"),
                              title: Text(
                                "${PlacementCell.keys.elementAt(index)}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 18),
                              ),
                              contentPadding: EdgeInsets.zero,
                              leading: Container(
                                child: Image.asset(
                                  "assets/images/drawer_dp.jpg",
                                  width: 60,
                                  height: 60,
                                ),
                                decoration: BoxDecoration(
                                    // color: Colors.grey,
                                    borderRadius: BorderRadius.circular(12)),
                                width: 60,
                                height: 60,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                              style: TextStyle(
                                  fontWeight: FontWeight.w200,
                                  color: Colors.grey),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SocialContactIcon(
                                      iconData: FlutterIcons.twitter_faw,
                                      onTap: () {
                                        launch(
                                            "https://twitter.com/svuniversitytpt?lang=en");
                                      },
                                      color: Colors.blue,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    SocialContactIcon(
                                      iconData: FlutterIcons.mail_fea,
                                      onTap: () {
                                        launch("mailto:prakashsvssp@gmail.com");
                                      },
                                      color: Colors.red,
                                    ),
                                  ],
                                ),
                                SocialContactIcon(
                                  iconData: FlutterIcons.message1_ant,
                                  onTap: () {
                                    launch(
                                        "sms:${PlacementCell.values.elementAt(index)["Phone"]}");
                                  },
                                )
                              ],
                            )
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                      ),
                    )
                  ],
                ),
              ).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class SocialContactIcon extends StatelessWidget {
  final IconData iconData;
  final Function onTap;
  final Color color;
  const SocialContactIcon({
    Key key,
    this.iconData,
    this.onTap,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Icon(iconData, size: 20, color: color),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
