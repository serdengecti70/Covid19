import 'dart:convert';
import 'package:http/http.dart' as http;


const apiUrlSummary = "https://api.covid19api.com/summary";


// another covid api url
// const apiUrlAll = "https://coronavirus-19-api.herokuapp.com/all";
// const apiUrlCountry = "https://coronavirus-19-api.herokuapp.com/countries/";

class NetworkHelper {

  Future getAllData() async {
    http.Response response = await http.get(apiUrlSummary);
    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      return data;
    }
    else{
      print(response.statusCode);
      throw "error fetching data";
    }
    
  }
  //TODO: make logic for personal country info
  // Future getCountryData(String countryName) async {
  //   String url = "$apiUrlCountry/$countryName";
  //   http.Response response = await http.get(url);
  //   if(response.statusCode == 200){
  //     var data = jsonDecode(response.body);
  //     return data;
  //   }
  //   else{
  //     print(response.statusCode);
  //     throw "error fetching data";
  //   }
    
  // }
}




