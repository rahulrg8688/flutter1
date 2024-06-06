import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice22/screens/ErrorScreen.dart';
import 'package:practice22/screens/Loginscreen.dart';
import 'package:practice22/screens/SplashScreen.dart';
import 'package:practice22/screens/dashboard.dart';
import 'package:practice22/screens/registration.dart';

var onGenerate=(RouteSettings settings){
  if(settings.name=="/"){
    return MaterialPageRoute(builder: (builder)=>SplashScreen());
  }
  else if(settings.name=="/login"){
    return MaterialPageRoute(builder: (builder)=>Loginscreen());
  }
  else if(settings.name=="/register"){
    return MaterialPageRoute(builder: (builder)=>registration());
  }
  else if(settings.name=="/dashboard"){
    return MaterialPageRoute(builder: (builder)=>dashboard(email:settings.arguments.toString()));
  }
  else{
    return MaterialPageRoute(builder: (builder)=>Errorscreen());
  }
};