import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice22/main.dart';
import 'package:practice22/screens/dashboard.dart';
import 'package:practice22/screens/registration.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
 bool showPassword=false;
  SizedBox DefaultGap=SizedBox(height:20);
  var formkey=GlobalKey<FormState>();
  TextEditingController NameController=TextEditingController();
  TextEditingController Password=TextEditingController();


  @override
  void initState(){



   // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Login screen",textAlign:TextAlign.center,),
        backgroundColor: Colors.lightBlue,
      ),
      body:SingleChildScrollView(

        child: Form(

          key: formkey,
          child: Padding(

            padding: const EdgeInsets.all(8.0),
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Welcome to Login"),
                DefaultGap,
                  TextFormField(
                    onChanged: (value){
                      formkey.currentState!.validate();
                    },
                    validator: (value){
                      if(value==null||value.isEmpty){
                        return "Plz enter the value";
                      }
                      return null;
                    },
                    controller: NameController,
                    decoration:InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter your name",
                      labelText: "Name",
                      prefixIcon: Icon(Icons.person),
                    ) ,
                  ),
                DefaultGap,
                TextFormField(
                  obscureText:showPassword,

                  controller: Password,
                  onChanged: (value){
                    formkey.currentState!.validate();
                  },

                   validator: (value){
                    if(value==null || value.isEmpty){
                      return "Plz enter password";
                    }
                    return null;
                  },
                  decoration:InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter your password",
                    labelText: "password",
                    prefixIcon: Icon(Icons.password),
                    suffixIcon: InkWell(
                        onTap: (){
                          setState(() {
                            showPassword=!showPassword;
                          });
                        },
                        child: showPassword?Icon(Icons.visibility_outlined):Icon(Icons.visibility_off_outlined),
                  ) ,
                ),
                ),
                DefaultGap,
                ElevatedButton(onPressed: ()async {
                  print("Name value is ${NameController.text}");
                  print("Password is ${Password.text}");
                  if(formkey.currentState!.validate()){
                   await sharedpreferences.setString("name","${NameController.text}");
                   await sharedpreferences.setBool("isUserLoggedin", true);
                   Navigator.of(context).pushNamedAndRemoveUntil("/dashboard",(route)=>false,arguments: NameController.text);
                    //Navigator.of(context).push(MaterialPageRoute(builder: (ctr)=>dashboard(email: NameController.text)));
                  }

                }, child:Text("Login")),
                TextButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctr)=>registration()));
                }, child:Text("Don't have an account",style:TextStyle(color:Colors.blue)))
              ],
            ),
          ),
        ),
      )
    );
  }
}
