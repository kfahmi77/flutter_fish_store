import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proyek_akhir/pages/homepage.dart';

import 'background.dart';

class MenuRegister extends StatefulWidget {
  const MenuRegister({Key? key}) : super(key: key);

  @override
  _MenuRegisterState createState() => _MenuRegisterState();
}

class _MenuRegisterState extends State<MenuRegister> {
  DateTime selectedDate = DateTime.now();
  var dateValue = TextEditingController();
  void _selectDate() {
    showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        selectedDate = pickedDate;
        dateValue.text = "${selectedDate.toLocal()}".split(' ')[0];
      });
    });
  }

  bool _setVisiblePassword = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Background(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 60),
                child: Center(
                  child: Image.asset(
                    "assets/logo.png",
                    width: 200.0,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Container(
                color: Colors.grey[20],
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(horizontal: 40),
                          child: TextFormField(
                            decoration: InputDecoration(
                                labelText: "Username",
                                labelStyle: TextStyle(color: Colors.black)),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(horizontal: 40),
                          child: TextFormField(
                            decoration: InputDecoration(
                                labelText: "Email",
                                labelStyle: TextStyle(color: Colors.black)),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(horizontal: 40),
                          child: TextFormField(
                            obscureText: _setVisiblePassword,
                            decoration: InputDecoration(
                                labelText: "Password",
                                labelStyle: TextStyle(color: Colors.black),
                                suffixIcon: IconButton(
                                  icon: Icon(_setVisiblePassword
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      _setVisiblePassword =
                                          !_setVisiblePassword;
                                    });
                                  },
                                )),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(horizontal: 40),
                          child: TextFormField(
                            decoration: InputDecoration(
                                labelText: "Tempat Lahir",
                                labelStyle: TextStyle(color: Colors.black)),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(horizontal: 40),
                          child: GestureDetector(
                            child: TextFormField(
                              controller: dateValue,
                              decoration: InputDecoration(
                                  labelText: "Tanggal Lahir",
                                  labelStyle: TextStyle(color: Colors.black)),
                              onTap: () {
                                _selectDate();
                              },
                              readOnly: true,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(horizontal: 40),
                          child: TextFormField(
                            decoration: InputDecoration(
                                labelText: "No Telepon",
                                labelStyle: TextStyle(color: Colors.black)),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Container(
                            alignment: Alignment.centerRight,
                            margin: EdgeInsets.symmetric(
                                horizontal: 40, vertical: 5),
                            child: ElevatedButton(
                              onPressed: () {
                                 Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => HomePage()),
  );
                              },
                              child: Text("Register"),
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(80.0),
                              )),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
      ),
    ));
  }
}
