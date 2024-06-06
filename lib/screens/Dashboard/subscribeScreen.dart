import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class subscribeScreen extends StatelessWidget {
  const subscribeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:GridView.builder(gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.6,
      ),
        itemCount: 10,
          itemBuilder:(ctx,index){

            return Card(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.home),
                Text("item $index"),
              ],
            ));
          })
    );
  }
}
