import 'package:http/http.dart' as http;
import 'dart:convert';

class DataService {
  Future<Map<String, int>> getTotalStatsData() async {
    final Map<String, int> totalStats = {};
    const String url = 'https://corona.lmao.ninja/v2/all';

    var response = await http.get(url);
    if (response.statusCode != 200) {
      print('Error ' + response.statusCode.toString());
      return null;
    } else {
      Map<String, dynamic> decodedResponse = json.decode(response.body);
      // print('DATA' + decodedResponse.toString());
      totalStats.putIfAbsent('confirmed', () => decodedResponse['cases']);
      totalStats.putIfAbsent('dead', () => decodedResponse['deaths']);
      totalStats.putIfAbsent('recovered', () => decodedResponse['recovered']);
      return totalStats;
    }
  }

  Future<Map<String, dynamic>> getCountryStatsData(String name) async {
    final Map<String, dynamic> countryStats = {};
    final String url = 'https://corona.lmao.ninja/v2/countries/' + name;

    var response = await http.get(url);
    if (response.statusCode == 404) {
      countryStats.putIfAbsent('confirmed', () => -1);
      countryStats.putIfAbsent('dead', () => -1);
      countryStats.putIfAbsent('recovered', () => -1);
      return countryStats;
    } else if (response.statusCode != 200) {
      print('Error ' + response.statusCode.toString());
      return null;
    } else {
      Map<String, dynamic> decodedResponse = json.decode(response.body);
      // print('DATA' + decodedResponse.toString());
      countryStats.putIfAbsent('confirmed', () => decodedResponse['cases']);
      countryStats.putIfAbsent('dead', () => decodedResponse['deaths']);
      countryStats.putIfAbsent('recovered', () => decodedResponse['recovered']);
      countryStats.putIfAbsent(
          'flag', () => decodedResponse['countryInfo']['flag']);
      countryStats.putIfAbsent('country', () => decodedResponse['country']);
      return countryStats;
    }
  }
}
