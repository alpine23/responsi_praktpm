import 'package:responsi_praktpm/models/list_agents.dart';
import 'package:responsi_praktpm/models/detail_agents.dart';
import 'package:responsi_praktpm/models/maps.dart';
import 'baseNetwork_service.dart';

class ApiDataSource {
  static ApiDataSource instance = ApiDataSource();
  
  Future<AgentResponse> loadAgents() async {
    final jsonResponse = await BaseNetwork.get("agents/");
    return AgentResponse.fromJson(jsonResponse);
  }

  Future<DetailResponse> loadAgentsDetail(String idDiterima) async {
    final jsonResponse = await BaseNetwork.get("$idDiterima");
    return DetailResponse.fromJson(jsonResponse);
  }

  // Future<MapResponse> loadDetail() async {
  //   final jsonResponse = await BaseNetwork.get("categories.php");
  //   return MapResponse.fromJson(jsonResponse);
  // }
}
