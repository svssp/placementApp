import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class StudentsPlaced extends StatefulWidget {
  @override
  _StudentsPlacedState createState() => _StudentsPlacedState();
}

class _StudentsPlacedState extends State<StudentsPlaced> {

  List<PieChartSectionData> _sections= List<PieChartSectionData>();

  @override
  void initState(){
    super.initState();

    PieChartSectionData _item1=PieChartSectionData(
      value: 34,
      title: "3.6 LPA",
      titleStyle: TextStyle(color: Colors.black38),
    );
    PieChartSectionData _item2=PieChartSectionData(
      value: 40,
      title: "4.8 LPA",
      titleStyle: TextStyle(color: Colors.black38),
    );
    PieChartSectionData _item3=PieChartSectionData(
      value: 26,
      title: "6.0 LPA",
      titleStyle: TextStyle(color: Colors.black38),
    );

    _sections=[_item1,_item2,_item3];
  }

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
          title: Text("Students Placed"),
          
        ),


        body: PieChart(
          PieChartData(
            sections: _sections,
            borderData: FlBorderData(show: false),
            sectionsSpace: 0,
          ),
        
          
        ),
    )
    );
  }
}