import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:practice22/Models/MovieModel.dart';

import 'ConstantsApi.dart';

class Moviewidgetapi {
 Future<List<Moviemodel>> getData() async {
    List<Moviemodel>MoviesList = [];

    try{
      http.Response retResponse = await http.get(
          Uri.parse(Constantsapi.MovieApi));
      if (retResponse.statusCode == 200) {
        List Moviedata = jsonDecode(retResponse.body);
        MoviesList = Moviedata.map((e) => Moviemodel.fromJSON(e)).toList();
      }
      else{
        return Future.error("Data not fetched");
      }
    }
    catch(ex){
      print(ex.toString());
      return Future.error(ex.toString());
    }


    return MoviesList;
  }

}