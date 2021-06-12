import 'package:flutter/material.dart';

List<String>PlacementCell=[
  "Dr.Vivekanandha Reddy",
  "P.Rakesh",
  "V.Madhuri",
  "K.Surya",
  "SVSSP"
];

class ContactCard extends StatelessWidget {
  String icon;
  String name;
  String sub;
  String phone;
  ContactCard(this.icon,this.name,this.sub,this.phone);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF5F7FB),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14,10,12,10),
        child: Row(
          
          children: [
            Expanded(
              flex: 1,
                          child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage("assets/images/download.jpeg")),
                  ),
              ),
            ),
            Expanded(
              flex: 5,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal:4),
                            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(name,
                style: TextStyle(
                  fontWeight:FontWeight.w600,
                  fontSize:20,
                ),),

                Text(sub,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                ),),
              ],),
                          ),
            ),
            Expanded(
              flex:1,
              child: Icon(Icons.email_outlined),)

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
      theme:ThemeData(
        
    primaryColor: Colors.white,
    fontFamily: 'inter',
    textTheme: TextTheme(
      headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      )),


      title: "Contact Placement Cell",

      home: new Scaffold(


        appBar: new AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: ()=>Navigator.of(context).pop(),
          ),
          title: new Text("Contact"),
          centerTitle: true,
          elevation: 0,
        ),

/*
        body: Container(
          color: Color(0xFFF5F7FB),
          child: SingleChildScrollView(
                      child: Column(
              children:PlacementCell.map(
                (item)=>Container(
                  width: double.infinity,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 0,vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                        color: Colors.black38,
                        offset: const Offset(
                          1.0,
                          1.0,
                        ),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
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
                      padding: const EdgeInsets.all(14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Text(item,
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                          ),
                          SizedBox(height:10),
                          Text("Placement Cell"),
                          Divider(height:20,color: Colors.black45,),
                          TextButton(child: Text("call",),autofocus: false,onPressed: (){},style: TextButton.styleFrom(padding:EdgeInsets.zero,alignment:Alignment.centerLeft),),
                        ]
                      ),
                    ),
                  ),
                )
              ).toList(),
              ),
          ),
        ),
*/

      body: SingleChildScrollView(
        child:Container(
          color: Color(0xFFF5F7FB),
          child: Column(
            children:PlacementCell.map((e) =>
            Column(
              children: [
                ContactCard("hello", e, "PlacementCell", "996"),
                Divider(color:Colors.grey),
              ],
            ), 
            ).toList(),
          ),
        ) ,),
      ),
    );

  }
}
