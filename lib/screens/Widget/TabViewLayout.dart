import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tabviewlayout extends StatefulWidget {
  const Tabviewlayout({super.key});

  @override
  State<Tabviewlayout> createState() => _TabviewlayoutState();
}

class _TabviewlayoutState extends State<Tabviewlayout> {
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 6,
        initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text("My Tab Layout"),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(text:"Flight",icon:Icon(Icons.flight)),
              Tab(text:"Directions",icon:Icon(Icons.directions)),
              Tab(text:"Bike",icon:Icon(Icons.directions_bike)),
              Tab(text:"Flight",icon:Icon(Icons.flight)),
              Tab(text:"Directions",icon:Icon(Icons.directions)),
              Tab(text:"Bike",icon:Icon(Icons.directions_bike)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Icon(Icons.flight,size:200),
            Icon(Icons.directions,size:200),
            Icon(Icons.directions_bike,size:200),
          Icon(Icons.flight,size:200),
      // Icon(Icons.directions,size:200),
      // Icon(Icons.directions_bike,size:200),
          ],
        ),
      ),
    );
  }
}
