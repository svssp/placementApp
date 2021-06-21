import 'package:flutter/material.dart';

class QuiickLinks extends StatelessWidget {
  IconData icon;
  String link;
  Function _onPress;
  QuiickLinks(this.icon,this.link,this._onPress);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: _onPress,
          child: Container(
        height: 60,
        width: 70,
        decoration: BoxDecoration(
          borderRadius:BorderRadius.all(Radius.circular(10)),
          
        color: Colors.white,
        ),
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Icon(icon,color: Colors.blueAccent[200],),
            SizedBox(height:4),
            Text(link,style: TextStyle(
              fontSize:12.0,
              color:Colors.blueAccent[200],
            ),)
          ]
        ),
      ),
    );
  }
}