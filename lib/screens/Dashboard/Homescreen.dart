import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(
        shrinkWrap:true,
        padding: EdgeInsets.all(8),
        children: [
          myContainer(index: 1),
          myContainer(index: 2),
          myContainer(index: 3)
        ],
      ),
    );
  }
  Widget myContainer({required int index,Color color=Colors.blue}){
    return Container(
      height:500,
      color:Colors.teal,
      width:double.infinity,
      child:Center(
        child:Text(

          "$index",
          style:TextStyle(fontSize: 20),
        )
      )
    );
  }
}
