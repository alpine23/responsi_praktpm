import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/map_model.dart';

class MapService {
  Future<List<GameMap>> fetchMaps() async {
    final response = await http.get(Uri.parse('https://valorant-api.com/v1/maps'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse.map((map) => GameMap.fromJson(map)).toList();
    } else {
      throw Exception('Failed to load maps');
    }
  }
}
