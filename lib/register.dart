import 'package:flutter/material.dart';
import 'package:placementport/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//flutter_launcher_icon
//flutter_native_splash

FirebaseAuth auth = FirebaseAuth.instance;

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var _displayusererror = false;
  bool _obscureText = true, _obscureText2 = true;
  bool _loading = false;
  String errmsg;
  String loading_text;
  final _formKey = GlobalKey<FormState>();
  var padding = EdgeInsets.all(0);
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();

  static Future<bool> checkExist(String email) async {
    bool exists = false;
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(email)
          .get()
          .then((doc) {
        if (doc.exists)
          exists = true;
        else
          exists = false;
      });
      return exists;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: !(_loading)
            ? SafeArea(
                child: Stack(children: [
                  Center(
                    child: SingleChildScrollView(
                      child: Container(
                        //margin: EdgeInsets.only(top:70),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Center(
                              child: Hero(
                                tag: "Logo",
                                child: Container(
                                    width: 200,
                                    height: 150,
                                    child: Builder(builder: (context) {
                                      return Image.asset(
                                          'assets/images/svuce.jpg');
                                    })),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15.0,
                                        right: 15.0,
                                        top: 0,
                                        bottom: 0),
                                    child: TextFormField(
                                      controller: emailcontroller,
                                      validator: (value) {
                                        Pattern pattern =
                                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                        RegExp regex = new RegExp(pattern);
                                        return (!regex.hasMatch(value) ||
                                                value.isEmpty)
                                            ? "Please enter valid e-mail"
                                            : null;
                                      },
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8))),
                                        hintText: 'Email',
                                        fillColor: Color(0xFFF5F7FB),
                                        filled: true,
                                        isDense: true,
                                        prefixIcon: Icon(Icons.email),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15.0,
                                        right: 15.0,
                                        top: 15,
                                        bottom: 0),
                                    child: TextFormField(
                                      controller: passcontroller,
                                      validator: (value) {
                                        return (value.isEmpty)
                                            ? "Please enter password"
                                            : null;
                                      },
                                      obscureText: _obscureText2,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8))),
                                          fillColor: Color(0xFFF5F7FB),
                                          filled: true,
                                          hintText: 'Password',
                                          suffixIcon: IconButton(
                                            icon: Icon(_obscureText2
                                                ? FlutterIcons.eye_fea
                                                : FlutterIcons.eye_off_fea),
                                            onPressed: () {
                                              setState(() {
                                                _obscureText2 = !_obscureText2;
                                              });
                                            },
                                          ),
                                          isDense: true,
                                          prefixIcon: Icon(Icons.lock)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15.0,
                                        right: 15.0,
                                        top: 15,
                                        bottom: 0),
                                    child: TextFormField(
                                      validator: (value) {
                                        return (value != passcontroller.text)
                                            ? "Password and Confirm Password doesn't match"
                                            : null;
                                      },
                                      obscureText: _obscureText,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8))),
                                          fillColor: Color(0xFFF5F7FB),
                                          filled: true,
                                          hintText: 'Confirm Password',
                                          suffixIcon: IconButton(
                                            icon: Icon(_obscureText
                                                ? FlutterIcons.eye_fea
                                                : FlutterIcons.eye_off_fea),
                                            onPressed: () {
                                              setState(() {
                                                _obscureText = !_obscureText;
                                              });
                                            },
                                          ),
                                          isDense: true,
                                          prefixIcon: Icon(Icons.lock)),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    height: 40.0,
                                    width: 150,
                                    child: Listener(
                                      onPointerDown: (item) {
                                        setState(() {
                                          padding =
                                              EdgeInsets.fromLTRB(2, 15, 2, 4);
                                        });
                                      },
                                      onPointerUp: (item) async {
                                        setState(() {
                                          padding = EdgeInsets.all(0);
                                        });
                                        if (_formKey.currentState.validate()) {
                                          setState(() {
                                            _loading = true;
                                          });
                                          if (await checkExist(
                                              emailcontroller.text)) {
                                            try {
                                              UserCredential userCredential =
                                                  await FirebaseAuth.instance
                                                      .createUserWithEmailAndPassword(
                                                email: emailcontroller.text,
                                                password: passcontroller.text,
                                              )
                                                      .then((value) {
                                                setState(() {
                                                  _loading = false;
                                                  _displayusererror = true;
                                                  errmsg =
                                                      "Successfully Registered! Please Login again";
                                                });
                                              });
                                            } on FirebaseAuthException catch (e) {
                                              if (e.code == 'weak-password') {
                                                setState(() {
                                                  _loading = false;
                                                  _displayusererror = true;
                                                  errmsg =
                                                      'The password provided is too weak.';
                                                });
                                              } else if (e.code ==
                                                  'email-already-in-use') {
                                                setState(() {
                                                  _loading = false;
                                                  _displayusererror = true;
                                                  errmsg =
                                                      'You have already registered. Please goto Login.';
                                                });
                                              }
                                            } catch (e) {
                                              setState(() {
                                                _loading = false;
                                                _displayusererror = true;
                                                errmsg = e.message;
                                              });
                                            }
                                          } else {
                                            print("lanja");
                                            setState(() {
                                              _loading = false;
                                              _displayusererror = true;
                                              errmsg =
                                                  "Please Register with the email you provided at clg";
                                            });
                                          }
                                        }
                                      },
                                      child: AnimatedPadding(
                                        padding: padding,
                                        curve: Curves.decelerate,
                                        duration: Duration(milliseconds: 700),
                                        child: MaterialButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              side: BorderSide(
                                                  color: Color.fromRGBO(
                                                      0, 160, 227, 1))),
                                          // onPressed: () {
                                          //     Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>HomePage()), (Route<dynamic> route) => false);
                                          //  },
                                          onPressed: () {
                                            //Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>HomePage()), (Route<dynamic> route) => false);
                                          },

                                          color: Color.fromRGBO(0, 160, 227, 1),
                                          textColor: Colors.white,
                                          child: Text("Register",
                                              style: TextStyle(fontSize: 15)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text.rich(TextSpan(
                                          text: "Already Have an Account. ",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            color: Colors.black,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: "Login",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                color: Colors.blue[300],
                                              ),
                                            )
                                          ]))),
                                  _displayusererror
                                      ? Text(
                                          errmsg,
                                          style: TextStyle(
                                            color: Colors.red,
                                          ),
                                        )
                                      : SizedBox(height: 0),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    child: MediaQuery.of(context).viewInsets.bottom != 0
                        ? SizedBox()
                        : Image.asset(
                            'assets/images/blob_down.png',
                            height: 140,
                            fit: BoxFit.fill,
                          ),
                    alignment: Alignment.bottomLeft,
                  ),
                  Align(
                    child: Image.asset(
                      'assets/images/blob_up.png',
                    ),
                    alignment: Alignment.topRight,
                  )
                ]),
              )
            : Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  Text("Registering............."),
                ],
              )),
      ),
    );
  }
}
