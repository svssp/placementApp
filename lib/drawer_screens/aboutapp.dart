import 'package:flutter/material.dart';

import 'about_app_team_widget.dart';

class AboutAppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> technologiesList = {
      "Flutter": FlutterLogo(
        size: 80,
      ),
      "Firebase":
          "https://cdn4.iconfinder.com/data/icons/google-i-o-2016/512/google_firebase-2-512.png",
      "One Signal":
          "https://onesignal-blog.s3.amazonaws.com/2018/Aug/onesignal-1534463753064.png",
      "Figma":
          "https://i.pinimg.com/originals/17/06/c9/1706c9f16bd08eb5e03f1df3e0a94a1c.png",
    };
    List<Map<String, String>> teamList = [
      {
        "name": "K Surya",
        "image":
            "https://raw.githubusercontent.com/svssp/imgs/main/placement/surya.jfif",
        "urlLink": "",
        "role": "Backend Developer"
      },
      {
        "name": "V Madhuri",
        "image":
            "https://raw.githubusercontent.com/svssp/imgs/main/placement/madhuri.jpg",
        "urlLink": "",
        "role": "UI Designer"
      },
      {
        "name": "SVSS Prakash",
        "image":
            "https://raw.githubusercontent.com/svssp/imgs/main/placement/svssp.jfif",
        "urlLink": "",
        "role": "App Developer"
      },
      {
        "name": "P Rakesh",
        "urlLink": "",
        "image":
            "https://raw.githubusercontent.com/svssp/imgs/main/placement/rakesh.jfif",
        "role": "UX Designer"
      }
    ];
    Map<String, String> hkData = {
      "name": "Dr Vivekananda Reddy",
      "urlLink": "",
      "image":
          "https://raw.githubusercontent.com/SVUCE-Programmers/Svuce-App-Resources/master/Database/Staff%20Data/Staff%20Photos/CSE/vivek.jpeg",
      "role": "Mentor & Placement head"
    };
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "About App",
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  horizontalTitleGap: 0.0,
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  subtitle: Container(
                    margin: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width - 220),
                    width: 150,
                    child: Divider(
                      thickness: 2,
                    ),
                  ),
                  title: Text(
                    "Developement Team",
                  ),
                ),
                Center(
                  child: TeamViewWidget(
                    data: hkData,
                  ),
                ),
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1.25, crossAxisCount: 2),
                  primary: false,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => TeamViewWidget(
                    data: teamList[index],
                    radius: 60,
                  ),
                  itemCount: teamList.length,
                ),
                ListTile(
                  horizontalTitleGap: 0.0,
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  subtitle: Container(
                    margin: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width - 200),
                    width: 150,
                    child: Divider(
                      thickness: 2,
                    ),
                  ),
                  title: Text(
                    "Technologies Used",
                  ),
                ),
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  primary: false,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      (technologiesList.values.elementAt(index) is String)
                          ? Image.network(
                              technologiesList.values.elementAt(index),
                              height: 80,
                            )
                          : technologiesList.values.elementAt(index),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${technologiesList.keys.elementAt(index)}",
                      )
                    ],
                  ),
                  itemCount: technologiesList.length,
                ),
              ],
            ),
          ),
        ));
  }
}
