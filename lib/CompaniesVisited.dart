import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class company
{
  String name;
  double nop;
  String pkg;
  company(this.name,this.nop,this.pkg);
}

List<company>c=[
  company("Infosys", 48,"3.6LPA,4.8LPA,5LPA"),
  company("Wipro", 47,"3.6LPA,4LPA"),
  company("Cognizant", 39,"4.5LPA,6LPA"),
  company("Fanatics", 2,"12LPA")
];

final colors=[
  [Colors.red[100],Colors.deepOrange[200]],
  [Colors.teal[200],Colors.cyan[400]],
  [Colors.amber[200],Colors.orange[300]]
];

List<BarChartGroupData>_bargroupdata=c.map((item)=>BarChartGroupData(
                          x: c.indexOf(item)+1,
                          barsSpace: 4,
                          barRods: [
                            BarChartRodData(
                              y: (item.nop)/5,
                              width: 14,
                              colors:  [Colors.blue, Colors.redAccent],
                              borderRadius: BorderRadius.zero,
                              
                            ),
                            
                          ],
                        ),).toList();



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
                SizedBox(height: 20,),
                AspectRatio(
                  aspectRatio: 1.5,
                                  child: BarChart(
                                    
                    BarChartData(
                      alignment: BarChartAlignment.spaceEvenly,
                      maxY: 20,
                      barGroups: _bargroupdata,
                        borderData: FlBorderData(show: true,
                        border: Border(
                          bottom: BorderSide(color: Colors.grey),
                          ),
                          
                          ),
                          
                          gridData: FlGridData(
                            drawHorizontalLine: true,
                            horizontalInterval: 4,
                          ),
                          titlesData: FlTitlesData(show: true,
                          leftTitles: SideTitles(
                            showTitles: true,
                            interval: 4,
                            getTitles: (double value){
                              return (value.toInt()*5).toString();
                            },),
                            bottomTitles: SideTitles(showTitles: true,
                            getTitles: (double value){
                              return c[value.toInt()-1].name;
                            })
                          ),
                          barTouchData: BarTouchData(
                            enabled: true,
                            touchTooltipData: BarTouchTooltipData(
                              tooltipBgColor: Color.fromRGBO(0, 0, 0, 0.7),
                              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                                return BarTooltipItem(
                                  c[group.x-1].pkg+'\n',
                                  TextStyle(color:Color.fromRGBO(255, 255, 255, 0.95) ,fontWeight: FontWeight.w500),
                                  children:[
                                    
                                    TextSpan(
                                      text:"Total: "+c[group.x-1].nop.toInt().toString()+" members",
                                      
                                      )
                                  ],
                                );
                              },
                            ),
                            )
                          )
                    ),
                  ),

                  SizedBox(height: 20,),

                  Column(
                    children: c.map((comp) =>Padding(
                        padding: const EdgeInsets.all(8.0),

                        child: Container(
                          
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: colors[(c.indexOf(comp))%3],begin: Alignment.topLeft,end: Alignment.centerRight),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            boxShadow: [
                              BoxShadow(
                            color: Colors.black38,
                            offset: const Offset(
                              3.0,
                              3.0,
                            ),
                            blurRadius: 1.0,
                            spreadRadius: 1.0,
                          ),

                          BoxShadow(
                            color: Colors.white,
                            offset: const Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ),
                         
                            ]
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(26,12,10,12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Infosys",
                                style: TextStyle(fontWeight:FontWeight.bold,fontSize:18,color: Colors.white),
                                ),
                                SizedBox(height: 12),
                                Text("number of Recruitments: 48",style:TextStyle(color:Colors.white70,fontSize: 15 )),
                                SizedBox(height:4),
                                Text("Packages Offered: 3.6LPA, 4.2LPA, 5LPA",style:TextStyle(color:Colors.white70,fontSize: 15 )),
                              ],
                              ),
                          ),
                        ),
                      ), ).toList()
                      
                  
                  ),
              ]
              ,) 
              ,),
          ),
    );
  }
}