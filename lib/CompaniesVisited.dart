import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class company
{
  String name;
  double nop;
  String pkg;
  String imgpath;
  company(this.name,this.nop,this.pkg,this.imgpath);
}

List<company>c=[
  company("Infosys", 38,"3.6LPA,4.8LPA,5LPA",'images/infosys.png'),
  company("Wipro", 47,"3.6LPA,4LPA",'images/wipro.png'),
  company("Accenture",11,"4.5LPA, 6.0LPA","images/accenture.png"),
  company("Cognizant", 39,"4.5LPA,6LPA",'images/cognizant.png'),
  company("Fanatics", 2,"12LPA",'images/fanatics.jpeg')
];



List<BarChartGroupData>_bargroupdata=c.map((item)=>BarChartGroupData(
                          x: c.indexOf(item)+1,
                          barsSpace: 4,
                          barRods: [
                            BarChartRodData(
                              y: (item.nop)/5,
                              width: 18 ,
                              colors:  [Colors.blue[300], Colors.blue[200]],
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
          actions: [
            PopupMenuButton(itemBuilder: (BuildContext context)
            {
              return [PopupMenuItem(child: Text("Sort By",style: TextStyle(fontWeight:FontWeight.w900),)),PopupMenuItem<String>(value: "Package",child: Text("Package Offered"),),PopupMenuItem<String>(value: "",child: Text("Total Recruitments"),)];
            })
          ],
          centerTitle: true,
          elevation: 0,
          ),

          body: SingleChildScrollView(
            child:Container(
              color: Color(0xFFF5F7FB),
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  AspectRatio(
                    aspectRatio: 1.5,
                                    child: Container(
                                      color: Colors.white,
                                      margin:  EdgeInsets.symmetric(horizontal:20,vertical: 8),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(12.0,8.0,12.0,4.0),
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
                                    ),
                    ),

                    SizedBox(height: 20,),

                    Column(
                      children: c.map((comp) =>Container(
                        margin: EdgeInsets.symmetric(horizontal:15,vertical: 10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Colors.white,
                         
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10,22,10,19),
                          child: Row(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
	                                      shape: BoxShape.circle,
                                    border: Border.all(color:Colors.black),
	                                      image: DecorationImage(
	                                        image: AssetImage("assets/"+comp.imgpath),
	                                        fit: BoxFit.fill
	                                      ),
                                  ),
                              ),

                              SizedBox(width: 12,),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(width: 7,),
                               
                              Text(comp.name,
                              style: TextStyle(fontWeight:FontWeight.bold,fontSize:18,color: Colors.black),
                              ),
                          
                             
                          SizedBox(height: 12),
                          Text("number of Recruitments: "+comp.nop.toInt().toString(),style:TextStyle(color:Colors.black54,fontSize: 15 )),
                          SizedBox(height:4),
                          Text("Packages Offered: "+comp.pkg,style:TextStyle(color:Colors.black54,fontSize: 15 )),
                           ],
                              ),
                            ],
                            ),
                        ),
                      ), ).toList()
                        
                    
                    ),
                ]
                ,),
            ) 
              ,),
          ),
    );
  }
}