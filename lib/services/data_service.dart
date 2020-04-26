import 'package:http/http.dart' as http;
import 'dart:convert';

class DataService {
  Future<Map<String, int>> getTotalStatsData() async {
    final Map<String, int> totalStats = {};
    const String url = 'https://corona.lmao.ninja/v2/all';

    var response = await http.get(url);
    Map<String, dynamic> decodedResponse = json.decode(response.body);
    print('DATA' + decodedResponse.toString());
    totalStats.putIfAbsent('confirmed', () => decodedResponse['cases']);
    totalStats.putIfAbsent('dead', () => decodedResponse['deaths']);
    totalStats.putIfAbsent('recovered', () => decodedResponse['recovered']);
    return totalStats;
  }
}
