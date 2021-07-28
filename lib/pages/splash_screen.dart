import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:proyek_akhir/pages/menu_login.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // set waktu untuk direct ke halaman lain
    Future.delayed(Duration(seconds: 2), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MenuLogin()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 300,
            width: 300,
            child: Lottie.asset("assets/splash_screen.json"),
          ),
          Text(
            'IwakKu',
            style: TextStyle(
              fontFamily: 'Krabby Patty',
              fontSize: 50,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(1.0, 1.0),
                  blurRadius: 3.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                Shadow(
                  offset: Offset(1.0, 1.0),
                  blurRadius: 8.0,
                  color: Color.fromARGB(125, 0, 0, 255),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
