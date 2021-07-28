import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            child: Image.asset("assets/login/top1.png"),
            top: 0,
            right: 0,
            width: size.width,
          ),
          Positioned(
            child: Image.asset("assets/login/top2.png"),
            top: 0,
            right: 0,
            width: size.width,
          ),
          Positioned(
            child: Image.asset("assets/login/bottom1.png"),
            bottom: 0,
            right: 0,
            width: size.width,
          ),
          Positioned(
            child: Image.asset("assets/login/bottom2.png"),
            bottom: 0,
            right: 0,
            width: size.width,
          ),
          child
        ],
      ),
    );
  }
}
