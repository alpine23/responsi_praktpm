class GameMap {
  final String uuid;
  final String displayName;
  final String coordinates;
  final String splash;
  final String mapUrl;

  GameMap({
    required this.uuid,
    required this.displayName,
    required this.coordinates,
    required this.splash,
    required this.mapUrl,
  });

  factory GameMap.fromJson(Map<String, dynamic> json) {
    return GameMap(
      uuid: json['uuid'],
      displayName: json['displayName'],
      coordinates: json['coordinates'] ?? 'No coordinates available',
      splash: json['splash'],
      mapUrl: json['mapUrl'],
    );
  }
}
