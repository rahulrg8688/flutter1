import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:practice22/screens/Api/EachItem.dart';
class todoApiScreen extends StatefulWidget {
  const todoApiScreen({super.key});

  @override
  State<todoApiScreen> createState() => _todoApiScreenState();
}

class _todoApiScreenState extends State<todoApiScreen> {
String Data="NA";
bool isLoading=false;
List todoList=[];
  getDataWithSynchronous (){
    http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos"))
        .then((value){
                print(value.statusCode);
                print(value.body);
                Data=value.body;
                setState(() {

                });
    }).onError((Error,stackTrace){});

  }
  getDataWithAsynchronous() async {


      setState(() {
        isLoading=true;
      });

 dynamic data= await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));

 Data=data.body;
 todoList=jsonDecode(Data) as List;
 print(todoList);
 setState(() {
isLoading=false;
 });

  }
  @override
  void initState() {
    getDataWithAsynchronous();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:Text("Api Calling"),
        backgroundColor: Colors.teal,
      ),
        body:isLoading?Center(child: CircularProgressIndicator()):
        ListView.builder(itemCount:todoList.length,itemBuilder: (context,index){
          Map map=todoList[index] as Map;
          return Card(
              child:
                InkWell(
                  onTap: (){
                    print("clicked");
                    print(map["id"].toString());
                    Get.to(()=>Eachitem(id:map["id"].toString()));
                   // Navigator.push(context,MaterialPageRoute(builder: (ctx)=>Eachitem(id:map["id"].toString())));
                  },
                  child: ListTile(
                    leading: Text(map["id"].toString()),
                     title:Text(map["title"].toString()),
                    trailing: map["completed"]?
                    Icon(
                        color:Colors.green,
                        size:30,
                        Icons.check):Icon(
                        color:Colors.red,
                        size:30,
                        Icons.close),
                  
                  
                  
                  ),
                ));
        })
    );
  }
}
