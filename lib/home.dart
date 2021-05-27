import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sample/drawer.dart';

final List<String> imagesList = [
  'assets/images/placement1.png',
  'assets/images/placement2.jpg',
  'assets/images/placement3.jpeg'
];

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex=0;
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
      bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'inter'),
      )),
      home: Scaffold(
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
        drawer: MyDrawer(),
      ),
    );
  }
}