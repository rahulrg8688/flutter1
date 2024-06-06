import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Errorscreen extends StatelessWidget {
  const Errorscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body:Text("Invalid route"),
    );
  }
}
