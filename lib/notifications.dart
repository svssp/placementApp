import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Companies
{
  String name;
  List<String>eligibility;
  String date;

  Companies(this.name,this.eligibility,this.date);
}

List<Companies>s=[Companies("Infosys",["Candidate Should be Human","Canditate should eat both veg and non-veg"],"30-12-2021"),
Companies("Wipro",["Candidate Should be Alien","Canditate must donate an UFO to company"],"30-12-2022"),
Companies("Cognizant",["Candidate Should be from China","Canditate should eat Aliens also"],"31-12-2023"),
Companies("Yahoo",["Candidate Should be yoho","Canditate must wear goggles"],"10-22-2021"),
];

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
      
      )),


      title: "Notifications",

      home: new Scaffold(


        appBar: new AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: ()=>Navigator.of(context).pop(),
          ),
          title: new Text("Notifications",style:Theme.of(context).textTheme.headline5.copyWith(fontWeight:FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 0,
        ),

        body: SingleChildScrollView(
          
          child: Container(
            color:Colors.grey[100],
            child:Column(

              children: s.map(
                (company) => Container(
                  decoration: BoxDecoration(
                        border:Border(bottom: BorderSide(width:1.0,color:Colors.grey[400]),/*top:BorderSide(width:1.0,color:Colors.grey)*/)
                      ),

                  child: Padding(

                    padding: const EdgeInsets.fromLTRB(12.0, 14.0, 4.0, 6.0),
                    child: Container(
                      width: double.infinity,
                      
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [


                          Align(
                            alignment: Alignment.center,
                            child: Text(company.name.toUpperCase(),
                            style: GoogleFonts.openSans(textStyle:TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20.0,
                            ),)
                            ),
                          ),

                          SizedBox(height:8),

                          Text("Eligibility Criteria :",style:GoogleFonts.montserrat(textStyle:TextStyle(
                            fontWeight:FontWeight.w500,
                            fontSize: 17.0,
                            ),
                            ),
                          ),

                          SizedBox(height:4),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: company.eligibility.map(
                              (eligibility) => Padding(
                                padding: const EdgeInsets.fromLTRB(8.0,2.0,0.0,2.0),
                                child: Container(
                                  child:Text((company.eligibility.indexOf(eligibility)+1).toString()+". "+eligibility,
                                  style: GoogleFonts.play(
                                     textStyle: TextStyle(
                              fontSize:16.0,
                              fontWeight: FontWeight.w300,
                            )
                          ),
                                )),
                              ),
                              ).toList(),
                          ),

                          SizedBox(height:8),

                          Text.rich(TextSpan(children: [
                            TextSpan(
                              text:"Last Date To Apply: ",
                              style: GoogleFonts.breeSerif(
                                textStyle: TextStyle(
                                  fontSize:15.0
                                )
                              ),
                            )
                            ,
                            TextSpan(
                              text:company.date,
                              style:TextStyle(color: Colors.blue[400],fontSize:15.0,fontWeight: FontWeight.bold),
                            )
                          ])),

                          Divider(height:30,color: Colors.grey[300]),

                          Align(
                            alignment: Alignment.centerRight,
                              child: TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size(20, 10),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                ),
                              child: Text("Apply now >>",textAlign: TextAlign.right,),
                              autofocus: false,
                              onPressed: (){},
                              ),
                          ),
                          SizedBox(
                            height:10,
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