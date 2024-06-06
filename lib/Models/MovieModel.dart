class Moviemodel {
  late int id;
 late String movie;
  late dynamic rating;
 late String image;
 late String imdb_url;

 Moviemodel({
   this.id=0,
  this.movie="",
  this.rating=0.0,
  this.image="",
  this.imdb_url="",
});
 //parsing the data using factory method
factory Moviemodel.fromJSON(Map map){
return Moviemodel(
 id:map['id']??0,
 movie:map['movie']??'',
 rating:map['rating']??0.0,
 image: map['image']??'',
 imdb_url: map['imdb_url']??'',
);
}

}