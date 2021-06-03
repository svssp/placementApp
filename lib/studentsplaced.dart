import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';


List <PieChartSectionData> _placements=[
  PieChartSectionData(
    color:Colors.cyan,
    value: 4000/131,
    radius: 30,
    showTitle: false,
    title: "3.6LPA",
  ),
  PieChartSectionData(
    color: Colors.lightBlue,
    value: 3000/131,
    radius: 30,
    showTitle: false,
    title: "4.2lpa",
  ),
  PieChartSectionData(
    color: Colors.green,
    value: 3600/131,
    radius: 30,
    showTitle: false,
    title: "4.5lpa",
  ),
  PieChartSectionData(
    color: Colors.orange,
    value: 1500/131,
    radius: 30,
    showTitle: false,
    title: "6lpa",
  ),
  PieChartSectionData(
    color: Colors.lightBlue,
    value: 800/131,
    radius: 30,
    showTitle: false,
    title: "8lpa",
  ),
  PieChartSectionData(
    color: Colors.deepPurple,
    value: 200/131,
    radius: 30,
    showTitle: false,
    title: "12lpa",
  ),
];

class StudentsPlaced extends StatefulWidget {
  @override
  _StudentsPlacedState createState() => _StudentsPlacedState();
}

class _StudentsPlacedState extends State<StudentsPlaced> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData(  
    primaryColor: Colors.white,
     fontFamily: 'inter',
      textTheme: TextTheme(
      headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'inter'),
      )),


      home: new Scaffold(


        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: ()=>Navigator.of(context).pop(),
          ),
          centerTitle: true,
          elevation: 0,
          title: Text("Students Placed"),
          
        ),


        body: SingleChildScrollView(
                  child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1.4,
                              child: PieChart(
                    PieChartData(
                      sections: _placements,
                      borderData: FlBorderData(show:false),
                      centerSpaceRadius: 40,
                      sectionsSpace: 0,
                      startDegreeOffset: 90,
                      
                    ),  
                  ),
              ),

              Wrap(
                alignment: WrapAlignment.spaceEvenly,
                direction: Axis.horizontal,                 
                  children: _placements.map(
                    (package) => Padding(
                      padding: const EdgeInsets.fromLTRB(4.0,0.0,8.0,10.0),
                      child: Container(
                        width: 80,
                        child: Row(
                          children:[
                            Container(
                              decoration:BoxDecoration(
                                shape:BoxShape.circle,
                                color: package.color,
                              ),
                              height: 18,
                              width: 18,
                              
                            ),
                            SizedBox(width:4),
                            Text(package.title,
                            style:TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),
                            ),
                            ]
                        ),
                      ),
                    )).toList(),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(18.0,4.0,0,0),
                      child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          
                          SizedBox(height:12),
                          Text("Total number of placements: "+"172",
                          style: TextStyle(
                            fontSize:18,
                          ),),
                          SizedBox(height:12),
                          Text("Total Number Of Students Participated: "+"120",
                          style: TextStyle(
                            fontSize:18,
                          ),),
                          SizedBox(height:12),
                          Text("Percentage of Students Placed: "+"64%",
                          style: TextStyle(
                            fontSize:18,
                          ),),
                          SizedBox(height:12),
                          Text("Heighest Package Offered: "+"12 LPA",
                          style: TextStyle(
                            fontSize:18,
                          ),),
                          SizedBox(height:12),
                          Text("Highest Package offered Company: "+"Name Marchipoyya",
                          style: TextStyle(
                            fontSize:18,
                          ),),
                          SizedBox(height:12),
                          Text("Student who got Highest Package : "+"JP, VB",
                          style: TextStyle(
                            fontSize:18,
                          ),),
                          SizedBox(height:12),
                          Text("Average Package: "+"3.6 LPA",
                          style: TextStyle(
                            fontSize:18,
                          ),),
                          SizedBox(height:12),
                          Text("Median Package: "+"3.6 LPA",
                          style: TextStyle(
                            fontSize:18,
                          ),),
                          SizedBox(height:12),
                          Text("Company Offering Higher Placements: "+"Telidhu",
                          style: TextStyle(
                            fontSize:18,
                          ),),
                        ],
                      )),
                    ),
                ),
            ],
          ),
        ),
    )
    );
  }
}