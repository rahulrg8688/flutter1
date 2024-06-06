import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:practice22/Models/dataModel.dart';

class Networkcontroller extends GetxController{
  List<data> dataList=[];
  bool isLoading=false;
  getData() async{
    isLoading=true;
    update();
    http.Response res= await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));


    dataList= (jsonDecode(res.body) as List).map((e)=>data.fromJson(e)).toList();
    isLoading=false;
    update();
  }
}