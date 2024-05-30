class DetailAgent {
  final String uuid;
  final String displayName;
  final String description;
  final String developerName;
  final String fullPortrait;
  final String background;
  final Role role;
  final List<Ability> abilities;

  DetailAgent({
    required this.uuid,
    required this.displayName,
    required this.description,
    required this.developerName,
    required this.fullPortrait,
    required this.background,
    required this.role,
    required this.abilities,
  });

  factory DetailAgent.fromJson(Map<String, dynamic> json) {
    return DetailAgent(
      uuid: json['uuid'],
      displayName: json['displayName'],
      description: json['description'],
      developerName: json['developerName'],
      fullPortrait: json['fullPortrait'],
      background: json['background'],
      role: json['role'],
      abilities: json['abilities'],
    );
  }
}

class Ability {
  final String displayName;
  final String displayIcon;

  Ability({
    required this.displayName,
    required this.displayIcon,
  });

  factory Ability.fromJson(Map<String, dynamic> json) {
    return Ability(
      displayName: json['displayName'],
      displayIcon: json['displayIcon'],
    );
  }
}

class Role {
  final String uuid;
  final String displayName;
  final String description;
  final String displayIcon;
  final String assetPath;

  Role({
    required this.uuid,
    required this.displayName,
    required this.description,
    required this.displayIcon,
    required this.assetPath,
  });
}

class DetailResponse {
  final List<DetailAgent> detail;

  DetailResponse({required this.detail});

  factory DetailResponse.fromJson(Map<String, dynamic> json) {
    var list = json['details'] as List;
    List<DetailAgent> detailList =
        list.map((i) => DetailAgent.fromJson(i)).toList();
    return DetailResponse(detail: detailList);
  }
}
