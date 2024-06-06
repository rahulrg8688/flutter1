import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Eachitem extends StatefulWidget {
  var id;
   Eachitem({super.key,this.id});

  @override
  State<Eachitem> createState() => _EachitemState();
}

class _EachitemState extends State<Eachitem> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:Text("Items"),
      ),
      body:Column(
        children: [
          Text(widget.id)
        ],
      )
    );
  }
}
