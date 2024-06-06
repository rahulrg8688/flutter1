import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice22/main.dart';
import 'package:practice22/screens/dashboard.dart';
import 'package:practice22/screens/registration.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState(){
    print("timer started");
    Timer(Duration(seconds: 5),() async {
      print("Timer completed");
            bool? data=await sharedpreferences.getBool("isUserLoggedin");
      if(data!=null) {
        if (data) {
          Navigator.push(context,
              MaterialPageRoute(builder: (ctx) => dashboard(email: "")));
        }
      }
      else{
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (ctr)=>registration()),(route)=>false);

      }
    });

    super.initState();
  }


  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.teal,
      body:Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
              alignment: Alignment.center,
              child: Icon(Icons.h_mobiledata)),
          Text("Hai welcome to the application")
        ],
      )
    );
  }
}
