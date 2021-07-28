import 'dart:ui';

import 'package:proyek_akhir/pages/homepage.dart';

import 'background.dart';
import 'package:flutter/material.dart';
import 'package:proyek_akhir/pages/menu_register.dart';

class MenuLogin extends StatefulWidget {
  const MenuLogin({Key? key}) : super(key: key);

  @override
  _MenuLoginState createState() => _MenuLoginState();
}

class _MenuLoginState extends State<MenuLogin> {
  bool _setVisiblePassword = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
            Widget>[
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
                                  _setVisiblePassword = !_setVisiblePassword;
                                });
                              },
                            )),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      margin:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                      child: Text(
                        "Lupa Sandi?",
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                    ),
                    Container(
                        alignment: Alignment.centerRight,
                        margin:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                            );
                          },
                          child: Text("Login"),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80.0),
                          )),
                        )),
                    Container(
                      alignment: Alignment.centerRight,
                      margin:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MenuRegister()),
                          );
                        },
                        child: Text(
                          "Daftar",
                          style: TextStyle(color: Colors.blueAccent),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
