import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:practice22/screens/Loginscreen.dart';

import 'dashboard.dart';



class registration extends StatefulWidget {
  const registration({super.key});

  @override
  State<registration> createState() => _registrationState();
}

class _registrationState extends State<registration> {
  SizedBox GapInBetween=SizedBox(height: 10,);
  bool visiblePassword=false;
  XFile? xFile;
  var _formkey=GlobalKey<FormState>();
  TextEditingController nameEditingController=TextEditingController();
  TextEditingController EmailEditingController=TextEditingController();
  TextEditingController passwordEditingController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title:Text("Registration Form")
      ),
      body:SingleChildScrollView(

        child: Form(
          key:_formkey,
          child: Container(
            padding: EdgeInsets.all(8),
            child: Column(
          
              children: [
                Text("Welcome to the app",textAlign: TextAlign.center,
                style:Theme.of(context).textTheme.titleLarge),
                GapInBetween,
                Stack(
                  children: [
                    if (xFile!=null)
          
                      CircleAvatar(
                        radius:30,
                        backgroundImage:FileImage(File(xFile!.path)),
                    )
                    else CircleAvatar(
                        radius:30,
          
                      ),
                    Positioned(
                        bottom:0,
                        right:10,
                        child: InkWell(
                            onTap:() async{
                            ImagePicker imagepicker=ImagePicker();
                           xFile=await imagepicker.pickImage(source:
                           ImageSource.camera,imageQuality: 30,preferredCameraDevice: CameraDevice.front);
                            if(xFile!=null){
                              print("Image picked");
                              print(xFile);
                              setState(() {
          
                              });
                            }
                            else{
                              print("Image not picked");
                            }
          
                        },child: Icon(Icons.photo_camera)))
                  ],
                ),
                GapInBetween,
                TextFormField(
                  controller: nameEditingController,
                  onChanged: (value){
                    _formkey.currentState!.validate();
                  },
                  validator: (value){
                    if(value==null||value.isEmpty){
                      return "please enter the name";
                    }
                    else if(value.length<4){
                      return "Plz enter atleast 4 characters";
                    }
                    return null;

                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: "Enter name",
                      label:Text("Name"),
                      border:OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
          
                  ),
                ),
                GapInBetween,
                TextFormField(
                  controller: EmailEditingController,
                  onChanged: (value){
                    _formkey.currentState!.validate();
                  },
                  validator: (value){
                    if(value==null||value.isEmpty){
                      return "please enter the mail";
                    }
                    else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)){
                      return "please enter valid email";
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: "Enter Email",
                    label:Text("Email"),
                    border:OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                ),
                GapInBetween,
                TextFormField(
                  controller:passwordEditingController,
                  onChanged: (value){
                    _formkey.currentState!.validate();
                  },
                  validator: (value){
                    if(value==null || value.isEmpty){
                      return "Plz enter password";
                    }
                    else if(value.length<6){
                      return "Length must be atleast 6 characters";
                    }
                    return null;
                  },
                  obscureText: visiblePassword,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(hintText: "Enter password",
                    label:Text("Password"),
                    border:OutlineInputBorder(),
                    prefixIcon: Icon(Icons.password),
                    suffixIcon: InkWell(
                        onTap: (){
                          setState(() {
                            visiblePassword=!visiblePassword;
                          });
                        },
                        child: visiblePassword?Icon(Icons.visibility_outlined):Icon(Icons.visibility_off_outlined)),
          
                  ),
                ),
                GapInBetween,
              ElevatedButton(onPressed: (){
                FocusScope.of(context).unfocus();
                print("name value ${nameEditingController}");
                if(xFile==null){
                  Fluttertoast.showToast(msg: "plz select file");
                }
                else if(_formkey.currentState!.validate()){



                  Fluttertoast.showToast(msg: "FIle submitted");
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>dashboard(email:EmailEditingController.text)));
                }

              }, child: Text("Register")),
                TextButton(onPressed: (){
                  Navigator.of(context).pushNamedAndRemoveUntil("/login",(route)=>false);
                  //Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>Loginscreen()));
                }, child: Text("Already have an account??",style: TextStyle(color:Colors.blue),))
              ],
            ),
          ),
        ),
      )
    );
  }
}

