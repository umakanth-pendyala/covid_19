import 'package:http/http.dart'  as http;
import 'dart:convert';

class CovidInfo {
  Future<dynamic> getGlobally () async {
    try {
      http.Response response = await http.get('https://coronavirus-19-api.herokuapp.com/countries');
      var data = jsonDecode(response.body);
      return data[0];
    } catch(e) {
      return e;
    }
  }

  Future<dynamic> getTotalInACountry(String countryName) async {
    try {
      String url = 'https://coronavirus-19-api.herokuapp.com/countries/$countryName';
      http.Response response = await http.get(url);
      var data = jsonDecode(response.body);
      return data;
    } catch (e) {
      return e;
    }
  }

  Future<dynamic> getAllCountries() async {
    try {
      String url = 'https://coronavirus-19-api.herokuapp.com/countries';
      http.Response response = await http.get(url);
      var data = jsonDecode(response.body);
      return data[0];
    } catch (e) {
      return e;
    }
  }
}
