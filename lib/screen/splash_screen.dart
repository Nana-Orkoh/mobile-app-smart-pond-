import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image.asset("assets/images/sapa_logo_white.jpg",
              //     width: 200, height: 200),
             Text("Self Driving Car", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600, color: Colors.black))
            ],
          )),
        ],
      ),
    );
  }
}