class Agent {
  String uuid;
  String displayName;
  String description;
  String developerName;
  String displayIcon;
  String displayIconSmall;
  String bustPortrait;
  String fullPortrait;
  String fullPortraitV2;
  String killfeedPortrait;
  String background;
  List<String> backgroundGradientColors;
  String assetPath;
  bool isFullPortraitRightFacing;
  bool isPlayableCharacter;
  bool isAvailableForTest;
  bool isBaseContent;
  Role role;
  List<Ability> abilities;

  Agent({
    required this.uuid,
    required this.displayName,
    required this.description,
    required this.developerName,
    required this.displayIcon,
    required this.displayIconSmall,
    required this.bustPortrait,
    required this.fullPortrait,
    required this.fullPortraitV2,
    required this.killfeedPortrait,
    required this.background,
    required this.backgroundGradientColors,
    required this.assetPath,
    required this.isFullPortraitRightFacing,
    required this.isPlayableCharacter,
    required this.isAvailableForTest,
    required this.isBaseContent,
    required this.role,
    required this.abilities,
  });

  factory Agent.fromJson(Map<String, dynamic> json) {
    return Agent(
      uuid: json['uuid'] ?? '',
      displayName: json['displayName'] ?? 'Unknown',
      description: json['description'] ?? 'No description available',
      developerName: json['developerName'] ?? 'Unknown',
      displayIcon: json['displayIcon'] ?? '',
      displayIconSmall: json['displayIconSmall'] ?? '',
      bustPortrait: json['bustPortrait'] ?? '',
      fullPortrait: json['fullPortrait'] ?? '',
      fullPortraitV2: json['fullPortraitV2'] ?? '',
      killfeedPortrait: json['killfeedPortrait'] ?? '',
      background: json['background'] ?? '',
      backgroundGradientColors: (json['backgroundGradientColors'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      assetPath: json['assetPath'] ?? '',
      isFullPortraitRightFacing: json['isFullPortraitRightFacing'] ?? false,
      isPlayableCharacter: json['isPlayableCharacter'] ?? false,
      isAvailableForTest: json['isAvailableForTest'] ?? false,
      isBaseContent: json['isBaseContent'] ?? false,
      role: json['role'] != null ? Role.fromJson(json['role']) : Role.empty(),
      abilities: (json['abilities'] as List<dynamic>?)
              ?.map((e) => Ability.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class Role {
  String uuid;
  String displayName;
  String description;
  String displayIcon;
  String assetPath;

  Role({
    required this.uuid,
    required this.displayName,
    required this.description,
    required this.displayIcon,
    required this.assetPath,
  });

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      uuid: json['uuid'] ?? '',
      displayName: json['displayName'] ?? 'Unknown',
      description: json['description'] ?? 'No description available',
      displayIcon: json['displayIcon'] ?? '',
      assetPath: json['assetPath'] ?? '',
    );
  }

  factory Role.empty() {
    return Role(
      uuid: '',
      displayName: 'Unknown',
      description: 'No description available',
      displayIcon: '',
      assetPath: '',
    );
  }
}

class Ability {
  String slot;
  String displayName;
  String description;
  String displayIcon;

  Ability({
    required this.slot,
    required this.displayName,
    required this.description,
    required this.displayIcon,
  });

  factory Ability.fromJson(Map<String, dynamic> json) {
    return Ability(
      slot: json['slot'] ?? '',
      displayName: json['displayName'] ?? 'Unknown',
      description: json['description'] ?? 'No description available',
      displayIcon: json['displayIcon'] ?? '',
    );
  }
}
