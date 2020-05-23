import 'dart:convert';
import 'package:chiliz_tracker_bloc/model/chiliz_model.dart';
import 'package:chiliz_tracker_bloc/repo/base_chiliz.dart';
import 'package:http/http.dart' as http;

class ChilizRepo extends BaseChilizRepo {
  final http.Client _client;

  ChilizRepo({http.Client httpClient}) : _client = httpClient ?? http.Client();

  @override
  Future<List<Coin>> getData() async {
    List<Coin> coin = [];
    try {
      String url = 'https://api.chiliz.net/openapi/quote/v1/ticker/24hr';
      final res = await _client.get(url);
      if(res.statusCode == 200){
        print(res.statusCode.toString());
        print(res.body.toString());
        Iterable result = json.decode(res.body);
      //  print(result.toList());
        result.forEach((element)=>coin.add(Coin.fromJson(element)));
      }
      return coin;
    } catch (e) {
      throw e;
    }
  }

  @override
  void dispose() {
    _client.close();
  }
}
