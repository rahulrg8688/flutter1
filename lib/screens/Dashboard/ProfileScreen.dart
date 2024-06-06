import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  SizedBox GapDefault=SizedBox(width: 0,);
  bool isChecked=false;
  bool userUsagePolicyCheckbox=false;
  dynamic selectedIndex=0;
  String ?DropText=null;
  int DropDownSelected=0;
  List<String> BankNames=["Hdfc","Sbi","Bob","Icici"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex:35,
                child: CircleAvatar(
                  radius:50,
                  backgroundImage: CachedNetworkImageProvider(
                      "https://media.sproutsocial.com/uploads/2022/06/profile-picture.jpeg"
                  ),
                ),
              ),
              
              Expanded(
                flex:60,
                child: Row(children:
                [

                ProfileCountsWidget("post","0")
                ,
                GapDefault,
                ProfileCountsWidget("Followers","123"),
                GapDefault,
                ProfileCountsWidget("Following", "222")
                ]),
              )
                ],

          ),

Row(
  children: [
    Expanded(
        flex:70,
        child: ElevatedButton(onPressed: (){}, child: Text("Follow"))),
    Expanded(
        flex:30,
        child: ElevatedButton(onPressed: (){}, child: Text("Favourite")))
    ,
  ],
),
          Text("Preferences"),
          Row(
            children: [
              Checkbox(value:isChecked, onChanged:(status){
              setState(() {

                isChecked=status!;
                print(isChecked);
              });

              }),
              Text("Agree"),
            ],

          ),

          CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              hoverColor:Colors.teal,
              value: userUsagePolicyCheckbox,
              title: Text("Agree"),
              onChanged:(status){
            setState(() {
              userUsagePolicyCheckbox=status!;

            });

          }),
            Text("gender preferences"),
          RadioListTile(value:0,title:Text("Male") , groupValue:selectedIndex, onChanged:(text){
          selectedIndex=text!;
setState(() {
print(selectedIndex);
});
          }),
          RadioListTile(value:1,title:Text("Female") , groupValue:selectedIndex, onChanged:(text){
            selectedIndex=text!;
            setState(() {
                print(selectedIndex);
            });
          }),
          RadioListTile(value:2,title:Text("Other") , groupValue:selectedIndex, onChanged:(text){
            selectedIndex=text!;
            setState(() {
              print(selectedIndex);
            });
          }),

          Text("Drop down "),
          Container(
            height: 50,
            width:200,
            child: DropdownButton(
              value:DropText,
                items:BankNames.
                map((e)=>DropdownMenuItem(value:e,child:Text(e))).toList(),
                onChanged: (value){
                setState(() {
                  DropText=value;
                  print(DropText);
                });

                },

                // items:
                // [
                //   DropdownMenuItem(child:Text("SBI"),value:1),
                //   DropdownMenuItem(child: Text("Hdfc"),value:2),
                //   DropdownMenuItem(child: Text("ICICI"),value:3),
                // ]
                // , onChanged: (value){
                //   print(value);
                //         setState(() {
                //           DropDownSelected=value!;
                //
                //
    //         });

                ),
          )
          
        ],

      )
      //this is basic understabding of flexable widget and expanded widget
      // body: Container(
      //   width:double.infinity,
      //   child: Column(
      //     children: [
      //     Expanded(child: Container(
      //       width: double.infinity,
      //         color:Colors.red,
      //         child: Text("Iam child widget"))),
      //       Expanded(child: Container(
      //           color:Colors.blue,
      //           child: Text("Ia m child widget"))),
      //       Flexible(child: Container(
      //           color:Colors.purple,
      //           child: Text("I am a aaaaaaaaaaaaaaaaaaaaaaflex widget"))),
      //       IgnorePointer(
      //         ignoring: false,
      //         child: TextButton(onPressed: (){
      //           print("I am clicked");
      //         }, child: Text("view video (Ignore pointer)")),
      //       ),
      //       AbsorbPointer(
      //         absorbing: false,
      //         child: TextButton(onPressed:(){
      //           print("clicked absorb pointer");
      //         } , child: Text("View button absorb pointer")),
      //       ),
      //
      //     ],
      //   ),
      // ),
    );
  }

  Widget ProfileCountsWidget(String title,String Count){
    return Column(
      children: [
        Text(Count,style:TextStyle(color:Colors.grey,fontSize: 24)),
        Text(title,style: TextStyle(color: Colors.black),),

      ],
    );
  }
}
