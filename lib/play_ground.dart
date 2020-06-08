import 'package:http/http.dart'  as http;
import 'dart:convert';


void main () async {
  var allCountries = await getAllCountries();
  for (int i = 0; i < allCountries.length; i++) {
    print(allCountries[i]['country'] + "\t" + allCountries[i]['cases'].toString());
  }

}



// global      https://coronavirus-19-api.herokuapp.com/all
Future<dynamic> getTotalWorld () async {
  try {
    http.Response response = await http.get('https://coronavirus-19-api.herokuapp.com/all');
    var data = jsonDecode(response.body);
    return data;
  } catch(e) {
    return e;
  }
}

// country specific  https://coronavirus-19-api.herokuapp.com/countries/India
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
    return data;
  } catch (e) {
    return e;
  }
}


