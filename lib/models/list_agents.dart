class Agent {
  final String uuid;
  final String displayName;
  final String developerName;
  final String displayIcon;

  Agent({
    required this.uuid,
    required this.displayName,
    required this.developerName,
    required this.displayIcon,
  });

  factory Agent.fromJson(Map<String, dynamic> json) {
    return Agent(
      uuid: json['uuid'],
      displayName: json['displayName'],
      developerName: json['developerName'],
      displayIcon: json['displayIcon']
    );
  }
}

class AgentResponse {
  final List<Agent> agent;

  AgentResponse({required this.agent});

  factory AgentResponse.fromJson(Map<String, dynamic> json) {
    var list = json['agent'] as List;
    List<Agent> agentList = list.map((i) => Agent.fromJson(i)).toList();
    return AgentResponse(agent: agentList);
  }
}
