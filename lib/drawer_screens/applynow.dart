import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:placementport/drawer_screens/CompaniesVisited.dart';
import 'package:placementport/utils/date_utils.dart';

class RegforComp extends StatefulWidget {
  var company;
  RegforComp(this.company);
  @override
  _RegforCompState createState() => _RegforCompState(company);
}

class _RegforCompState extends State<RegforComp> {
  var company;
  _RegforCompState(this.company);

  DateTime currentDate = DateTime.now();
  var tenthc = TextEditingController();
  var interc = TextEditingController();
  var btechc = TextEditingController();
  var extrac = TextEditingController();
  var _isuploaded = true;
  var errtext;

  var useremail = FirebaseAuth.instance.currentUser.email;
  /* Future<void> _selectDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime(DateTime.now().year - 1),
        firstDate: DateTime(1990),
        lastDate: DateTime(2030));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });
    birthdatec.text = DateTimeUtils().getWholeDate(
      pickedDate.millisecondsSinceEpoch,
    );
  }*/

  @override
  Widget build(BuildContext context) {
    var registerstu = FirebaseFirestore.instance.collection("$company");
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(useremail)
          .snapshots(),
      builder: (context, snapshot) {
        print("User Details is:${snapshot.data.data()}");
        if (snapshot.hasData) {
          return Scaffold(
              backgroundColor: Colors.white,
              appBar: new AppBar(
                backgroundColor: Color(0xFFF5F7FB),
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                title: new Text("$company",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                elevation: 0,
              ),
              body: SingleChildScrollView(
                child: Form(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: tenthc,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          hintText: 'Tenth Percentage or GPA',
                          fillColor: Color(0xFFF5F7FB),
                          filled: true,
                          isDense: true,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: interc,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          hintText: 'Inter Percentage or GPA',
                          fillColor: Color(0xFFF5F7FB),
                          filled: true,
                          isDense: true,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: btechc,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          hintText: 'Btech Percentage or GPA',
                          fillColor: Color(0xFFF5F7FB),
                          filled: true,
                          isDense: true,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: extrac,
                        maxLines: null,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          hintText: 'Any Skills',
                          fillColor: Color(0xFFF5F7FB),
                          filled: true,
                          isDense: true,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            _isuploaded = false;
                            errtext = "Uploading......";
                          });
                          try {
                            String rollNo = snapshot.data.data()['rollnumber'];
                            await registerstu.doc(rollNo ?? "11706050").set({
                              'name': snapshot.data.data()['name'],
                              'email': useremail,
                              'tenth': tenthc.text,
                              'inter': interc.text,
                              'btech': btechc.text,
                              'phone': snapshot.data.data()['phone'],
                              'branch': snapshot.data.data()['branch'],
                            });
                            setState(() {
                              _isuploaded = true;
                              errtext = "Uploaded Successfully...";
                            });
                          } catch (e) {
                            print(e);
                            setState(() {
                              _isuploaded = true;
                              errtext = e.toString();
                            });
                          }
                        },
                        child: Center(child: Text("UPLOAD")),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      !_isuploaded ? CircularProgressIndicator() : SizedBox(),
                      Text(errtext ?? ''),
                    ],
                  ),
                )),
              ));
        }
        return Scaffold(
          body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                CircularProgressIndicator(),
              ])),
        );
      },
    );
  }
}
