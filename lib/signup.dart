import 'package:flutter/material.dart';
import 'package:placementport/home.dart';
//flutter_launcher_icon
//flutter_native_splash


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: LogIn(),
      ),
    );
  }
}


class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  var padding=EdgeInsets.all(0);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            //margin: EdgeInsets.only(top:70),
            child: Column(
              
              children: <Widget>[
                Center(
                  child: Container(
                      width: 200,
                      height: 150,
                      child: Image.asset('assets/images/svuce.jpg')),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))
                        ),
                        hintText: 'Roll number'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  child: TextField(

                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))
                        ),
                        hintText: 'Date Of Birth'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 50.0,
                  width: 150,
                  child: Listener(
                    onPointerDown: (item){
                      setState(() {
                         padding=EdgeInsets.fromLTRB(2,15,2,4);
                       
                      });
                    },

                    onPointerUp: (item){
                      setState(() {
                         padding=EdgeInsets.all(0);
                         
                      });
                      Duration(milliseconds:100);
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>HomePage()), (Route<dynamic> route) => false);
                    },

                    
                                      child: AnimatedPadding(
                      padding: padding,
                      curve: Curves.decelerate,
                      duration: Duration(milliseconds:700),
                                        child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
                       // onPressed: () {
                      //     Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>HomePage()), (Route<dynamic> route) => false);
                      //  },
                      onPressed: (){
                       //Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>HomePage()), (Route<dynamic> route) => false);
                      },
                        
                        color: Color.fromRGBO(0, 160, 227, 1),
                        textColor: Colors.white,
                        child: Text("Login",
                            style: TextStyle(fontSize: 15)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
