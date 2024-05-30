import 'package:flutter/material.dart';
import '../services/apiMap_service.dart';
import '../models/map_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ListMapsScreen extends StatefulWidget {
  @override
  _ListMapsScreenState createState() => _ListMapsScreenState();
}

class _ListMapsScreenState extends State<ListMapsScreen> {
  late Future<List<GameMap>> futureMaps;

  @override
  void initState() {
    super.initState();
    futureMaps = MapService().fetchMaps();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Valorant Maps",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple[300],
      ),
      body: FutureBuilder<List<GameMap>>(
        future: futureMaps,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No maps found'));
          } else {
            List<GameMap> maps = snapshot.data!;
            return ListView.builder(
              itemCount: maps.length,
              itemBuilder: (context, index) {
                return Card(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  child: InkWell(
                    onTap: () {
                      _launchURL(maps[index].displayIcon);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image.network(maps[index].splash),
                          SizedBox(height: 10.0),
                          Text(
                            maps[index].displayName,
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            maps[index].coordinates,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
