import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:placementport/utils/date_utils.dart';

class NewStudent extends StatefulWidget {
  const NewStudent({Key key}) : super(key: key);

  @override
  _NewStudentState createState() => _NewStudentState();
}

class _NewStudentState extends State<NewStudent> {
  DateTime currentDate = DateTime.now();
  var namec = TextEditingController();
  var birthdatec = TextEditingController();
  var emailc = TextEditingController();
  var rollnumc = TextEditingController();
  var branchc = TextEditingController();
  var phonec = TextEditingController();
  var _isuploaded = true;
  var errtext;

  Future<void> _selectDate(BuildContext context) async {
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
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          backgroundColor: Color(0xFFF5F7FB),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: new Text("Upload Student",
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
                  controller: rollnumc,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    hintText: 'Roll number',
                    fillColor: Color(0xFFF5F7FB),
                    filled: true,
                    isDense: true,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  maxLines: null,
                  controller: emailc,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    hintText: 'Email',
                    fillColor: Color(0xFFF5F7FB),
                    filled: true,
                    isDense: true,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  maxLines: null,
                  controller: phonec,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    hintText: 'Phone number',
                    fillColor: Color(0xFFF5F7FB),
                    filled: true,
                    isDense: true,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: namec,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    hintText: 'Student name',
                    fillColor: Color(0xFFF5F7FB),
                    filled: true,
                    isDense: true,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () => _selectDate(context),
                  child: TextFormField(
                    enabled: false,
                    controller: birthdatec,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      hintText: 'Birth Date',
                      fillColor: Color(0xFFF5F7FB),
                      filled: true,
                      isDense: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                DropdownButtonFormField(
                  onChanged: (value) {
                    setState(() {
                      branchc.text = value;
                    });
                  },
                  items: ["CSE", "ECE", "ME", "CE", "EE", "Ch.E"]
                      .map((e) => DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          ))
                      .toList(),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    hintText: 'Branch',
                    fillColor: Color(0xFFF5F7FB),
                    filled: true,
                    isDense: true,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isuploaded = false;
                      errtext = "Uploading......";
                    });
                    return users
                        .doc(emailc.text)
                        .set({
                          // Stokes and Sons
                          'birthdate': birthdatec.text,
                          'branch': branchc.text,
                          'name': namec.text,
                          'phone': phonec.text,
                          'isAdmin': false,
                          'rollnumber': rollnumc.text, // 42
                        })
                        .then((value) => setState(() {
                              _isuploaded = true;
                              errtext = "Uploaded Successfully...";
                            }))
                        .catchError((error) => setState(() {
                              errtext = error;
                            }));
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
}
