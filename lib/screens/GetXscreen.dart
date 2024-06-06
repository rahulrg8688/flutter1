import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice22/Controller/MygetxController.dart';

class Getxscreen extends StatefulWidget {
  const Getxscreen({super.key});

  @override
  State<Getxscreen> createState() => _GetxscreenState();
}

class _GetxscreenState extends State<Getxscreen> {

  Mygetxcontroller mygetxcontroller=Get.put(Mygetxcontroller());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title:Text("GetX"),
            bottom:TabBar(tabs: [
              Text("Getx_basics"),
              Text("Getx_2"),
              Text("Getx_3"),
              Text("Getx_4"),
            ]) ,
        ),
        body: TabBarView(
          children:
             [
              Column(
                children: [
                  ElevatedButton(onPressed: (){
                    Get.showSnackbar(GetSnackBar(message: "I am ",));
                  }, child:Text("Show snackbar")),
                  ElevatedButton(onPressed: (){
                    Get.defaultDialog(title:"Alert");
                  }, child:Text("Show Dialog")),
                  ElevatedButton(onPressed: (){
                    Get.changeTheme(ThemeData.dark());
                  }, child:Text("change theme")),
                  ElevatedButton(onPressed: (){
                    Get.changeTheme(ThemeData.light());
                  }, child:Text("change theme to light")),
                  ElevatedButton(onPressed: (){
                    Get.bottomSheet(
                      backgroundColor: Colors.teal,
                     Container(
                         height:Get.height*0.4,
                         width: Get.width*1,

                         child: Text("data"),color:Colors.blue)
                    );
                  }, child: Text("Show Bottom sheet")),
                  GetBuilder<Mygetxcontroller>(
                      builder: (mygetxcontroller) {
                        return Text(mygetxcontroller.count.toString(),style:TextStyle(fontSize: 100),);
                      }
                  ),
                  ElevatedButton(onPressed: (){
                    mygetxcontroller.increaseCount();
                  }, child:Text("increase")),
                  ElevatedButton(onPressed: (){
                    mygetxcontroller.decrementCount();
                  }, child: Text("decrease")),
                ],
              ),
               Text("Get2"),
               Text("get3"),
               Text("Get4")

            ],
          ),
        ),
    );
  }
}
