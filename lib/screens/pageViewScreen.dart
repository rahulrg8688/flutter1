import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class pageviewscreen extends StatefulWidget {
  const pageviewscreen({super.key});

  @override
  State<pageviewscreen> createState() => _pageviewscreenState();
}

class _pageviewscreenState extends State<pageviewscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Page view"),
      ),
      body:PageView(
        children: [
          myPage(1),
          myPage(2),
          myPage(3)
        ],
      )
    );
  }
  Widget myPage(int index){
    return Center(child:Text("page ${index}",
    style:TextStyle(fontSize: 30,color: Colors.teal,backgroundColor: Colors.red)

    ));
  }
}
