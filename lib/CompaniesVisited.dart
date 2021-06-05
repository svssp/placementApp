import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class CompaniesVisited extends StatefulWidget {

  @override
  _CompaniesVisitedState createState() => _CompaniesVisitedState();
}

class _CompaniesVisitedState extends State<CompaniesVisited> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "inter",
        primaryColor: Colors.white,
        ),

        title: "Companies Visited",

        home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: ()=>Navigator.of(context).pop(),
          ),
          title: new Text("Companies",style:Theme.of(context).textTheme.headline5.copyWith(fontWeight:FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 0,
          ),

          body: SingleChildScrollView(
            child:Column(
              children: [
                AspectRatio(
                  aspectRatio: 1.6,
                                  child: BarChart(
                                    
                    BarChartData(
                    
                      alignment: BarChartAlignment.spaceEvenly,
                      maxY: 20,
                      barGroups: [
                        BarChartGroupData(
                          x: 0,
                          barsSpace: 4,
                          barRods: [
                            BarChartRodData(
                              y: 8,
                              width: 14,
                              colors:  [Colors.blue, Colors.redAccent],
                              borderRadius: BorderRadius.zero,
                            )
                          ]
                        ),
                         BarChartGroupData(
                          x: 1,
                          barsSpace: 4,
                          barRods: [
                            BarChartRodData(
                              y: 12,
                              width: 14,
                              colors:  [Colors.blue, Colors.redAccent],
                              borderRadius: BorderRadius.zero,
                            )
                          ]
                        ),

                        BarChartGroupData(
                          x: 2,
                          barsSpace: 4,
                          barRods: [
                            BarChartRodData(
                              y: 10,
                              width: 14,
                              colors:  [Colors.blue, Colors.redAccent],
                              borderRadius: BorderRadius.zero,
                            )
                          ]
                        ),
                      ]
                    ),
                  ),
                ),
              ]
              ,) 
              ,),
          ),
    );
  }
}