import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice22/screens/StateManagement/Controllers/MystateController.dart';
import 'package:practice22/screens/StateManagement/Controllers/getxController.dart';

class Statemanagement extends StatefulWidget {
  const Statemanagement({super.key});

  @override
  State<Statemanagement> createState() => _StatemanagementState();
}

class _StatemanagementState extends State<Statemanagement> {

  Mystatecontroller mystatecontroller=Get.put(Mystatecontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("State Management"),

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Obx(()=>Text("obs current value : ${mystatecontroller.count}"))),
         SizedBox(),
          GetX(
              init:getxcontroller(),
              builder:(controller)=>Column(
                children: [
                  Text("Getx name is ${controller.name}"),
                  TextField(
                    decoration: InputDecoration(hintText: "Enter name"),
                    onChanged: (str){
                      controller.name.value=str;
                    },
                  )
                ],
              ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          mystatecontroller.increment();
        },
        child: Icon(Icons.plus_one),
      ),
    );
  }
}
