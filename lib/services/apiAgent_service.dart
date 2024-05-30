import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/agent_model.dart';

class AgentService {
  static const String apiUrl = 'https://valorant-api.com/v1/agents';

  Future<List<Agent>> fetchAgents() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body)['data'];
      List<Agent> agents =
          body.map((dynamic item) => Agent.fromJson(item)).toList();
      return agents;
    } else {
      throw Exception('Failed to load agents');
    }
  }
}
