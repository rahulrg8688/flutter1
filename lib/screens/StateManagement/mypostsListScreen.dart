import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:practice22/screens/StateManagement/Controllers/NetworkController.dart';

class mypostListScreen extends StatefulWidget {
  const mypostListScreen({super.key});

  @override
  State<mypostListScreen> createState() => _mypostListScreenState();
}

class _mypostListScreenState extends State<mypostListScreen> {
  Networkcontroller networkcontroller=Get.put(Networkcontroller());

  @override
  void initState() {
    networkcontroller.getData();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  title:Text("Data List Screen")

),
      body:GetBuilder<Networkcontroller>(builder:(controller){
       return Center(
         child: controller.isLoading?CircularProgressIndicator(): Center(
           child: controller.dataList.isEmpty ?Text("No Data"): ListView.builder(
                itemCount: controller.dataList.length,
                itemBuilder: (ctx,index){
                  return Text(controller.dataList[index].id.toString());
                }),
         ),
       );
      })
    );
  }
}
