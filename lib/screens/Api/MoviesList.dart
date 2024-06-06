import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practice22/Models/MovieModel.dart';
import 'package:practice22/screens/Widget/ConstantsApi.dart';
import 'package:url_launcher/url_launcher.dart';

class Movieslist extends StatefulWidget {
  const Movieslist({super.key});

  @override
  State<Movieslist> createState() => _MovieslistState();
}

class _MovieslistState extends State<Movieslist> {
List<Moviemodel> MoviesList=[];
//String MovieData='';
  getData() async{
   http.Response retResponse= await http.get(Uri.parse(Constantsapi.MovieApi));
  if(retResponse.statusCode==200) {
    List Moviedata= jsonDecode(retResponse.body);
    MoviesList=Moviedata.map((e)=>Moviemodel.fromJSON(e)).toList();


  }
   setState(() {
     print("Mghjhjhjhj");
        print(MoviesList);
   });

  }

  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:ListView.builder(
            itemCount: MoviesList.length,
            itemBuilder: (context,index){
              Moviemodel moviemodel=MoviesList[index];
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

        })
    );
  }
}
