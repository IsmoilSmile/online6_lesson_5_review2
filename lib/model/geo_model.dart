

/* {
    "id": 1,
    "name": "Leanne Graham",
    "username": "Bret",
    "email": "Sincere@april.biz",
    "address": {
      "street": "Kulas Light",
      "suite": "Apt. 556",
      "city": "Gwenborough",
      "zipcode": "92998-3874",
      "geo": {
        "lat": "-37.3159",
        "lng": "81.1496"
      }
    },
    "phone": "1-770-736-8031 x56442",
    "website": "hildegard.org",
    "company": {
      "name": "Romaguera-Crona",
      "catchPhrase": "Multi-layered client-server neural-net",
      "bs": "harness real-time e-markets"
    }
  },*/
import 'dart:convert';

class Geo{
 late String lat;
 late String lng;

  Geo({required this.lat,required this.lng});

  Geo.fromJson(Map<String, dynamic>json):
      lat=json["lat"],
      lng=json['lng'];


  Map<String,dynamic>toJson()=>{
    "lat":lat,
    "lng":lng
  };

}

class Address{
  late String street;
  late String suite;
  late String city;
  late String zipcode;
  late Geo geo;
  Address({
  required this.city,
  required this.geo,
  required this.street,
  required this.suite,
  required this.zipcode
  });
  Address.fromJson(Map<String,dynamic>json){
    street = json["street"];
    suite = json["suite"];
    city = json['city'];
    zipcode = json["zipcode"];
    geo = Geo.fromJson(json["geo"]);
  }
  Map<String , dynamic> toJson() =>{
    "street":street,
    "suite":suite,
    "city":city,
    "zipcode":zipcode,
    "geo":geo.toJson(),
};
}