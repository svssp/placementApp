import 'package:flutter/material.dart';
import 'package:placementport/home.dart';
import 'package:firebase_auth/firebase_auth.dart';

//flutter_launcher_icon
//flutter_native_splash

FirebaseAuth auth=FirebaseAuth.instance;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: (auth.currentUser==null)?LogIn():HomePage(),
    );
  }
}


class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  var _displayusererror=false;
  bool _loading=false;
      final _formKey = GlobalKey<FormState>();
    var padding=EdgeInsets.all(0);
    final emailcontroller=TextEditingController();
    final passcontroller=TextEditingController();
  @override
  Widget build(BuildContext context){

    
       


      return Scaffold(
      backgroundColor: Colors.white,
      body: !(_loading)?Center(
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
                Form(
                  key: _formKey,
                    child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                        child: TextFormField(
                          controller: emailcontroller,
                          validator: (value){
                             Pattern pattern =r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                             RegExp regex = new RegExp(pattern);
                             return (!regex.hasMatch(value)||value.isEmpty) ? "Please enter valid e-mail" : null;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12))
                              ),
                              hintText: 'Email'),
                        ),
                      ),
                   
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 15, bottom: 0),
                    child: TextFormField(
                      controller: passcontroller,
                      validator: (value){
                             
                             return (value.isEmpty)? "Please enter password" : null;
                          },
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12))
                          ),
                          hintText: 'Password'),
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

                      onPointerUp: (item) async{
                        setState(() {
                           padding=EdgeInsets.all(0);
                           
                        });
                        if (_formKey.currentState.validate()) {
                          setState(() {
                            _loading=true;
                          });
                           try {
                            UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: emailcontroller.text,
                            password: passcontroller.text,
                        ).then((value) {
                          
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>HomePage()), (Route<dynamic> route) => false);
                        });
                        } on FirebaseAuthException catch (e) {
                        setState(() {
                           _displayusererror=true;
                           _loading=false;
                        });
                      }
                        }
                        else
                        {
                          print("lowdalo gola");
                        return;
                        }
                       // _formKey.currentState.save();
                        
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
                        onPressed: () {
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
                  SizedBox(height:10),
                  _displayusererror?Text("Incorrect password/Enter Your e-mail id registred at SVUCE!!",
                  style: TextStyle(
                    color:Colors.red,
                  ),):SizedBox(height:0),
                   ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ):
      Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            Text("Logging in ......"),
          ],
        )) ,
    );
    
  }
}
