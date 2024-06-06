import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:practice22/screens/Widget/MovieWidgetApi.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Models/MovieModel.dart';
import '../Widget/ConstantsApi.dart';

class Futurewidgetexample extends StatefulWidget {
  const Futurewidgetexample({super.key});

  @override
  State<Futurewidgetexample> createState() => _FuturewidgetexampleState();
}

class _FuturewidgetexampleState extends State<Futurewidgetexample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Future Widget Example"),
      ),
      body: FutureBuilder(future: Moviewidgetapi().getData(),builder:(context,snapshot){
        if(snapshot.hasData){
          if(snapshot.data!=null&&snapshot.data!.isNotEmpty){
            List<Moviemodel>? list= snapshot.data ?? [];
           return ListView.builder(
                itemCount: list.length,
                itemBuilder: (ctx,index){
                  Moviemodel moviemodel=list[index];
                  return moviecard(moviemodel);
            });
          }
          else{
            //handle here empty data
          }

        }
        else if(snapshot.hasError){
        return Text(snapshot.error.toString());
        }
        return Center(child: CircularProgressIndicator());
      } ,),
    );
  }

  Widget moviecard(moviemodel){
    return Card(child: Container(
        padding: EdgeInsets.all(3),
        child: Column(
          children: [

            Row(
              children: [
                Expanded(
                  flex:1,
                  child: CachedNetworkImage(imageUrl:"${Constantsapi.BaseApi}/${moviemodel.image}",
                    width: 100,
                    height: 100,
                    errorWidget: (context,url,error)=>Icon(Icons.image,size: 20,),
                  ),
                ),
                Expanded(
                  flex:9,
                  child: Row(
                    children: [
                      Text(moviemodel.movie),
                      Spacer(),
                      Text(moviemodel.rating.toString()),
                    ],
                  ),
                ),
              ],
            ),
            Text(moviemodel.imdb_url),
            ElevatedButton(onPressed: (){
              print("Pressed");
              launchUrl (Uri.parse(moviemodel.imdb_url),mode: LaunchMode.externalApplication);
            }, child:Text("click here for IMDB ratings"))
          ],
        ))

    );
  }
}
