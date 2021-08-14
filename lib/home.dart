import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:placementport/widgets/drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:placementport/widgets/quicklinks.dart';
import 'package:placementport/drawer_screens/notifications.dart';
import 'package:placementport/drawer_screens/contact.dart';
import 'package:placementport/drawer_screens/CompaniesVisited.dart';
import 'package:auto_size_text/auto_size_text.dart';

final List<String> imagesList = [
  'assets/images/placement1.png',
  'assets/images/placement2.jpg',
  'assets/images/placement3.jpeg'
];

FirebaseFirestore _firestore = FirebaseFirestore.instance;

class HomePage extends StatefulWidget {
  final String email;
  HomePage(this.email);

  @override
  _HomePageState createState() => _HomePageState(email);
}

class _HomePageState extends State<HomePage> {
  bool _isadmin = false;
  String email;

  _HomePageState(this.email);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
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
  CollectionReference _user = _firestore.collection("users");
  var _currentIndex;
  bool _isadmin = false;
  String name;
  String roll;
  String branch;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _user.doc(email).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError)
            return Scaffold(
                body: Center(
              child: Text(
                "Error while Loading, Check Your Data Connection....",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                ),
              ),
            ));
          if (snapshot.hasData) {
            var data = snapshot.data.data();
            _isadmin = data['isAdmin'];
            if (!_isadmin) {
              print(data);
              name = data['name'];
              roll = data['rollnumber'];
              branch = data['branch'];
            }
            return Scaffold(
              backgroundColor: Color(0xFFF5F7FB),
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                title: Text('Placement Port'),
                elevation: 0,
                centerTitle: true,
              ),
              body: SingleChildScrollView(
                child: Container(
                  color: Color(0xFFF5F7FB),
                  child: Column(
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

                      /* Row(
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
                ),*/

                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Quick Links",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'opensans',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          QuickLinks(Icons.business_center_sharp, "companies",
                              () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CompaniesVisited()));
                          }),
                          QuickLinks(
                              Icons.notifications_active_sharp, "notifications",
                              () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Notifications()));
                          }),
                          QuickLinks(Icons.contact_mail_sharp, "contact", () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Contact()));
                          }),
                        ],
                      ),
                      SizedBox(height: 18),
                      Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Profile",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      fontFamily: 'opensans')),
                              SizedBox(height: 8),
                              AutoSizeText(
                                "The Placement Cell in S.V.U. College of Engineering has been operational for the last fifteen years, with the dual objective of imparting preparatory coaching to students and listening with the industry to arrange campus selections. The cell is headed by a Teacher, nominated by the Principal and is manned by an office assistant.",
                                maxLines: 6,
                                style: TextStyle(
                                  fontFamily: 'inter',
                                  height: 1.4,
                                  color: Colors.black,
                                  wordSpacing: 1.1,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          )),
                      SizedBox(height: 18),
                      Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Vision",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      fontFamily: 'opensans')),
                              SizedBox(height: 8),
                              AutoSizeText(
                                "The ultimate objective of the Placement Cell is to see that the students of all disciplines get maximum placement opportunities. It also endeavors to have continued interaction with the industry to expose the students to practical aspects of technological developments.It also wishes to provide opportunities to students to attain good communication skills by way of participation in seminars / symposia / conferences.",
                                maxLines: 8,
                                style: TextStyle(
                                  fontFamily: 'inter',
                                  height: 1.4,
                                  color: Colors.black,
                                  wordSpacing: 1.1,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
              drawer: _isadmin
                  ? MyDrawer(_isadmin)
                  : MyDrawer(
                      _isadmin, roll = roll, name = name, branch = branch),
            );
          }
          return Scaffold(
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  CircularProgressIndicator(),
                ])),
          );
        });
  }
}
