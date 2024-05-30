import 'package:responsi_praktpm/models/detail_agents.dart';
import 'package:flutter/material.dart';
import 'package:responsi_praktpm/services/api_service.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailAgentsScreen extends StatefulWidget {
  final String uuid;

  const DetailAgentsScreen({Key? key, required this.uuid}) : super(key: key);

  @override
  _DetailAgentsScreenState createState() => _DetailAgentsScreenState();
}

class _DetailAgentsScreenState extends State<DetailAgentsScreen> {
  late Future<DetailResponse> futureMeal;

  @override
  void initState() {
    super.initState();
    futureMeal = ApiDataSource.instance.loadAgentsDetail(widget.uuid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
      ),
      body: FutureBuilder<DetailResponse>(
        future: futureMeal,
        builder:
            (BuildContext context, AsyncSnapshot<DetailResponse> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error loading meal detail"),
            );
          } else if (snapshot.hasData) {
            return _buildAgentsDetail(snapshot.data!.detail[0]);
          } else {
            return Center(
              child: Text("No data available"),
            );
          }
        },
      ),
    );
  }

  Widget _buildAgentsDetail(DetailAgent detail) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            detail.fullPortrait,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  detail.displayName + detail.developerName,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Role: ${detail.role.displayName}",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                Text(
                  detail.description,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Abilities :",
                  style: TextStyle(fontSize: 16),
                ),
                // SizedBox(height: 8),
                // Image.network(
                //   detail.abilities.,
                //   width: double.infinity,
                //   height: 200,
                //   fit: BoxFit.cover,
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future openBrowserURL({
    required String url,
    bool inApp = false,
  }) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceWebView: inApp,
        enableJavaScript: true,
      );
    }
  }
}
