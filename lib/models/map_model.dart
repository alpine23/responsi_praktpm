class GameMap {
  final String uuid;
  final String displayName;
  final String coordinates;
  final String splash;
  final String displayIcon;

  GameMap({
    required this.uuid,
    required this.displayName,
    required this.coordinates,
    required this.splash,
    required this.displayIcon,
  });

  factory GameMap.fromJson(Map<String, dynamic> json) {
    return GameMap(
      uuid: json['uuid'] ?? 'Unknown UUID',
      displayName: json['displayName'] ?? 'Unknown Name',
      coordinates: json['coordinates'] ?? 'No coordinates available',
      splash: json['splash'] ?? '',
      displayIcon: json['displayIcon'] ?? '',
    );
  }
}
