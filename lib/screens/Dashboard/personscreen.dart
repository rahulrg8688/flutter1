import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice22/screens/MoreInfoScreen.dart';

class personscreen extends StatelessWidget {
  personscreen({super.key});
  List<String> frameworksList=["Jquery","Express","Angular","NextJs","Vuejs","Asp.net","Node js","React"];
  // List<String> ImagesList=[
  //   "https://www.google.com/imgres?q=react%20logo&imgurl=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fthumb%2Fa%2Fa7%2FReact-icon.svg%2F2300px-React-icon.svg.png&imgrefurl=https%3A%2F%2Fcommons.wikimedia.org%2Fwiki%2FFile%3AReact-icon.svg&docid=nfz2qKo0MFLwMM&tbnid=4fP0joQQKRm5dM&vet=12ahUKEwifiIXCuLWGAxVTSmwGHZ3pDDEQM3oECBMQAA..i&w=2300&h=2000&hcb=2&ved=2ahUKEwifiIXCuLWGAxVTSmwGHZ3pDDEQM3oECBMQAA",
  //   "https://www.google.com/imgres?q=react%20logo&imgurl=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fthumb%2Fa%2Fa7%2FReact-icon.svg%2F2300px-React-icon.svg.png&imgrefurl=https%3A%2F%2Fcommons.wikimedia.org%2Fwiki%2FFile%3AReact-icon.svg&docid=nfz2qKo0MFLwMM&tbnid=4fP0joQQKRm5dM&vet=12ahUKEwifiIXCuLWGAxVTSmwGHZ3pDDEQM3oECBMQAA..i&w=2300&h=2000&hcb=2&ved=2ahUKEwifiIXCuLWGAxVTSmwGHZ3pDDEQM3oECBMQAA",
  //   "https://www.google.com/imgres?q=react%20logo&imgurl=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fthumb%2Fa%2Fa7%2FReact-icon.svg%2F2300px-React-icon.svg.png&imgrefurl=https%3A%2F%2Fcommons.wikimedia.org%2Fwiki%2FFile%3AReact-icon.svg&docid=nfz2qKo0MFLwMM&tbnid=4fP0joQQKRm5dM&vet=12ahUKEwifiIXCuLWGAxVTSmwGHZ3pDDEQM3oECBMQAA..i&w=2300&h=2000&hcb=2&ved=2ahUKEwifiIXCuLWGAxVTSmwGHZ3pDDEQM3oECBMQAA",
  //   "https://www.google.com/imgres?q=react%20logo&imgurl=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fthumb%2Fa%2Fa7%2FReact-icon.svg%2F2300px-React-icon.svg.png&imgrefurl=https%3A%2F%2Fcommons.wikimedia.org%2Fwiki%2FFile%3AReact-icon.svg&docid=nfz2qKo0MFLwMM&tbnid=4fP0joQQKRm5dM&vet=12ahUKEwifiIXCuLWGAxVTSmwGHZ3pDDEQM3oECBMQAA..i&w=2300&h=2000&hcb=2&ved=2ahUKEwifiIXCuLWGAxVTSmwGHZ3pDDEQM3oECBMQAA",
  //   "https://www.google.com/imgres?q=react%20logo&imgurl=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fthumb%2Fa%2Fa7%2FReact-icon.svg%2F2300px-React-icon.svg.png&imgrefurl=https%3A%2F%2Fcommons.wikimedia.org%2Fwiki%2FFile%3AReact-icon.svg&docid=nfz2qKo0MFLwMM&tbnid=4fP0joQQKRm5dM&vet=12ahUKEwifiIXCuLWGAxVTSmwGHZ3pDDEQM3oECBMQAA..i&w=2300&h=2000&hcb=2&ved=2ahUKEwifiIXCuLWGAxVTSmwGHZ3pDDEQM3oECBMQAA",
  //   "https://www.google.com/imgres?q=react%20logo&imgurl=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fthumb%2Fa%2Fa7%2FReact-icon.svg%2F2300px-React-icon.svg.png&imgrefurl=https%3A%2F%2Fcommons.wikimedia.org%2Fwiki%2FFile%3AReact-icon.svg&docid=nfz2qKo0MFLwMM&tbnid=4fP0joQQKRm5dM&vet=12ahUKEwifiIXCuLWGAxVTSmwGHZ3pDDEQM3oECBMQAA..i&w=2300&h=2000&hcb=2&ved=2ahUKEwifiIXCuLWGAxVTSmwGHZ3pDDEQM3oECBMQAA",
  //   "https://www.google.com/imgres?q=react%20logo&imgurl=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fthumb%2Fa%2Fa7%2FReact-icon.svg%2F2300px-React-icon.svg.png&imgrefurl=https%3A%2F%2Fcommons.wikimedia.org%2Fwiki%2FFile%3AReact-icon.svg&docid=nfz2qKo0MFLwMM&tbnid=4fP0joQQKRm5dM&vet=12ahUKEwifiIXCuLWGAxVTSmwGHZ3pDDEQM3oECBMQAA..i&w=2300&h=2000&hcb=2&ved=2ahUKEwifiIXCuLWGAxVTSmwGHZ3pDDEQM3oECBMQAA",
  //   "https://www.google.com/imgres?q=react%20logo&imgurl=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fthumb%2Fa%2Fa7%2FReact-icon.svg%2F2300px-React-icon.svg.png&imgrefurl=https%3A%2F%2Fcommons.wikimedia.org%2Fwiki%2FFile%3AReact-icon.svg&docid=nfz2qKo0MFLwMM&tbnid=4fP0joQQKRm5dM&vet=12ahUKEwifiIXCuLWGAxVTSmwGHZ3pDDEQM3oECBMQAA..i&w=2300&h=2000&hcb=2&ved=2ahUKEwifiIXCuLWGAxVTSmwGHZ3pDDEQM3oECBMQAA",
  //
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView.builder(
          itemCount: frameworksList.length,
          itemBuilder: (ctx,index)
      {
        return Card(
          child: ListTile(
            onTap: () {
              print(frameworksList[index]);
            Navigator.push(context,MaterialPageRoute(builder:(ctx)=>Moreinfoscreen(
              title:frameworksList[index],
                description:'',
                image:'',
            )));
            },
            leading:CircleAvatar(

            ),
              title:Text(frameworksList[index],style:TextStyle(color:Colors.blue,fontWeight: FontWeight.bold)),
              subtitle: Text("Click here for more"),
            trailing:Icon(Icons.accessibility_sharp)
          
          
          ),
        );
      }
      )
    );
  }
}
