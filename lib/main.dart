import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice22/screens/Loginscreen.dart';
import 'package:practice22/screens/SplashScreen.dart';
import 'package:practice22/screens/registration.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Navigations/routes.dart';

late SharedPreferences sharedpreferences;
void main()  async{

  runApp(const MyApp());
  sharedpreferences=await SharedPreferences.getInstance();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
       initialRoute: '/',
      // routes: {
      //     '/':(context)=>SplashScreen(),
      //   '/login':(context)=>Loginscreen(),
      //
      // },
    onGenerateRoute: onGenerate,
    );
  }
}

