import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Moreinfoscreen extends StatelessWidget {
  final String title,description,image;
  const Moreinfoscreen({super.key,this.title='',this.description='',this.image=''});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(title),
      ),
    );
  }
}
