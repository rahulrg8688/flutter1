import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class practiceGetRequest extends StatefulWidget {
  const practiceGetRequest({super.key});

  @override
  State<practiceGetRequest> createState() => _practiceGetRequestState();
}

class _practiceGetRequestState extends State<practiceGetRequest> {
  List TodoList=[];
  String Data="NA";
  bool isLoading=false;
  getDataAsync() async{
    setState(() {
      isLoading=true;
    });
   dynamic res=await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));
    Data=res.body;
    TodoList=jsonDecode(Data) as List;
    setState(() {
      isLoading=false;
    });
  }
  @override
  void initState() {
    getDataAsync();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
appBar: AppBar(
  title: Text("Practice Api"),
),
      body: isLoading?Center(child: CircularProgressIndicator()):ListView.builder(
          itemCount: TodoList.length,
          itemBuilder: (context,index){
            Map map=TodoList[index] as Map;
            return Card(
              child: ListTile(
                title:Text(map["title"]),
                leading: Text(map["id"].toString()),
                trailing: map["completed"]?Icon(Icons.check):Icon(Icons.close),
              ),
            );

      }),
    );
  }
}
