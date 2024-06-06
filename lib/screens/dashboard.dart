import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice22/main.dart';
import 'package:practice22/screens/Api/FutureWidgetExample.dart';
import 'package:practice22/screens/Api/MoviesList.dart';
import 'package:practice22/screens/Api/todos_api_screen.dart';
import 'package:practice22/screens/Dashboard/Homescreen.dart';
import 'package:practice22/screens/Dashboard/ProfileScreen.dart';
import 'package:practice22/screens/Dashboard/personscreen.dart';
import 'package:practice22/screens/Dashboard/subscribeScreen.dart';
import 'package:practice22/screens/GetXscreen.dart';
import 'package:practice22/screens/Loginscreen.dart';
import 'package:practice22/screens/StateManagement/Statemanagement.dart';
import 'package:practice22/screens/StateManagement/mypostsListScreen.dart';
import 'package:practice22/screens/Widget/TabViewLayout.dart';
import 'package:practice22/screens/Widget/drawerItemWidget.dart';
import 'package:practice22/screens/pageViewScreen.dart';
import 'package:practice22/screens/practiceApi/PracticeGetrequest.dart';

class dashboard extends StatefulWidget {
  String email;

dashboard({required this.email});

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int selectedIndex=0;
  List dashboardScreens=[
    Homescreen(),
    personscreen(),
    subscribeScreen(),
    Profilescreen(),
  ];
@override
  void initState() {
  bool? islogged =sharedpreferences.getBool("isUserLoggedin");
print(islogged);
  // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
          key: _scaffoldKey,
        appBar: AppBar(
      
          leading: IconButton(
            onPressed: (){
              _scaffoldKey.currentState!.openDrawer();
            },
            icon:Icon(Icons.home)
          ),

      
          backgroundColor: Colors.teal,
          title: Text("Dashboard component"),
          actions: [
          IconButton(onPressed: (){
      
          }, icon: Icon(Icons.search,color:Colors.red)),
            IconButton(onPressed: (){
              showModalBottomSheet(
                isDismissible: false,
                  enableDrag: false,
                  context: context, builder:(ctr){
      
                return Column(
      
                  children: [
      
                    Text("Filter data"),
                    ListTile(title:Text("Filter By name"),),
                    ListTile(title:Text("Filter By price"),),
                    ListTile
                      (
                      title:Text("Filter by age"),
                    ),
                    TextButton(onPressed: (){
                      Navigator.pop(context);
                    }, child: Icon(Icons.close)),
      
                  ],
                );
              });
            }, icon:Icon(Icons.filter_alt,color: Colors.red,)),
            IconButton(onPressed:(){
              showDialog(context: context, builder: (ctx){
                return AlertDialog(
                  title:Text("Logout??"),
                  content: Text("Do you want to Logout???"),
                  actions: [
                    TextButton(onPressed: (){
                      sharedpreferences.remove("isUserLoggedin");
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (ctx)=>Loginscreen()), (route)=>false);
                    }, child: Text("Yes")),
                    TextButton(onPressed: (){
                      Navigator.pop(context);
                    }, child: Text("No"))
                  ],
                );
              });
            }, icon: Icon(Icons.logout_outlined,color:Colors.red)),
      
          ],
      
        ),
        drawer: Drawer(
          width:300,
          backgroundColor: Colors.grey,
          child:SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            
              Container(
                width:double.infinity,
                child: DrawerHeader(child:Text("Flutter and dart"),
                  decoration:BoxDecoration(color: Colors.teal),
                ),
              ),
                SingleChildScrollView(
               child: Column(
                 children: [
                   drawerItemWidget(title:"Home",onTap: (){
                     Navigator.pop(context);
                     Navigator.push(context,MaterialPageRoute(builder: (ctr)=>Homescreen()));
                   },),
                 ],
               ),
             ),
                drawerItemWidget(title:"Profile",onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (ctr)=>practiceGetRequest()));
                },),
                drawerItemWidget(title:"Logout"),
                drawerItemWidget(title:"TabItemView",onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (ctr)=>Tabviewlayout()));
                },),
                drawerItemWidget(title:"PageView",onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (ctr)=>pageviewscreen()));
                },),
                drawerItemWidget(title:"Movies",onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (ctx)=>Movieslist()));
                },),
                drawerItemWidget(title:"MoviesApiFutureWidget",onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (ctx)=>Futurewidgetexample()));
                },),
                drawerItemWidget(title:"stateManagement",onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (ctx)=>Statemanagement()));
                },),
            
                drawerItemWidget(title:"TodoApi",onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (ctx)=>todoApiScreen()));
                },),
                drawerItemWidget(title:"GetX",onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (ctx)=>Getxscreen()));
                },),
                drawerItemWidget(title:"ListPost",onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (ctx)=>mypostListScreen()));
                },)
            ],),
          )
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
      
            backgroundColor: Colors.teal,
          onTap: (position){
            print("postion ${position}");
            selectedIndex=position;
            setState(() {
            print("selected Index ${selectedIndex}");
            });
          },
            type:BottomNavigationBarType.fixed,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.black,
            selectedFontSize: 24,
          items:[
            BottomNavigationBarItem(icon:Icon(Icons.home),
            label:"Home"),
            BottomNavigationBarItem(icon: Icon(Icons.person),label:"person"),
            BottomNavigationBarItem(icon: Icon(Icons.subscript_outlined),label:"Subscribe"),
            BottomNavigationBarItem(icon: Icon(Icons.add),label: "profile")
                   ]
        ),
        body:
        dashboardScreens[selectedIndex]
      //   Column(
      //
      // children: [
      //
      // Column(
      //
      // children: [
      //
      // Padding(
      //
      //     padding: const EdgeInsets.all(8.0),
      // child: Text("Welcome to Dashboard ${widget.email}",style:TextStyle(
      // backgroundColor: Colors.blue,
      // )),
      //
      // ),
      // ],
      // ),
      //
      //
      // ],
      // )
      ),
    );

  }
}
