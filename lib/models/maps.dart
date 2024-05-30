class Map {
  String uuid;
  String displayName;
  String? coordinates;
  String? displayIcon;
  String mapUrl;

  Map({
    required this.uuid,
    required this.displayName,
    required this.coordinates,
    required this.displayIcon,
    required this.mapUrl,
  });

  // factory Map.fromJson(Map<String, dynamic> json) {
  //   return Map(
  //     uuid: json['uuid'],
  //     displayName: json['displayName'],
  //   );
  // }
}

// class MapResponse {
//   final List<Map> map;

//   MapResponse({required this.map});

//   factory MapResponse.fromJson(Map<String, dynamic> json) {
//     var list = json['maps'] as List;
//     List<Map> agentList = list.map((i) => Map.fromJson(i)).toList();
//     return MapResponse(map: mapList);
//   }
// }
