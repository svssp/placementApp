import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:placementport/utils/date_utils.dart';

class Notify extends StatefulWidget {
  const Notify({Key key}) : super(key: key);

  @override
  _NotifyState createState() => _NotifyState();
}

class _NotifyState extends State<Notify> {
  DateTime currentDate = DateTime.now();
  var namec = TextEditingController();
  var lastdatec = TextEditingController();
  var pkgc = TextEditingController();
  var criteriac = TextEditingController();
  var _isuploaded = true;
  var errtext;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2019),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });
    lastdatec.text = DateTimeUtils().getWholeDate(
      pickedDate.millisecondsSinceEpoch,
    );
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('notifications');
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          backgroundColor: Color(0xFFF5F7FB),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: new Text("Notify Student",
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
                  controller: namec,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    hintText: 'Company name',
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
                    controller: lastdatec,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      hintText: 'Last Date to Apply',
                      fillColor: Color(0xFFF5F7FB),
                      filled: true,
                      isDense: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: pkgc,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    hintText: 'Estimated Package',
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
                  controller: criteriac,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    hintText: 'Eligibility Criteria',
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
                    print(criteriac.text);
                    return users
                        .doc(namec.text)
                        .set({
                          // Stokes and Sons
                          'lastdate': lastdatec.text,
                          'package': pkgc.text,
                          'criteria': criteriac.text, // 42
                        })
                        .then((value) => setState(() {
                              _isuploaded = true;
                              errtext = "";
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
