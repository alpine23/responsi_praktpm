import 'package:flutter/material.dart';
import 'package:responsi_praktpm/models/list_agents.dart';
import 'package:responsi_praktpm/services/api_service.dart';
import 'package:responsi_praktpm/views/detailAgents_page.dart';

class ListAgentsScreen extends StatefulWidget {
  const ListAgentsScreen({super.key});

  @override
  State<ListAgentsScreen> createState() => _ListAgentsScreenState();
}

class _ListAgentsScreenState extends State<ListAgentsScreen> {
  late Future<AgentResponse> futureAgents;

  @override
  void initState() {
    super.initState();
    futureAgents = ApiDataSource.instance.loadAgents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List of Agents"),
      ),
      body: _buildListAgents(),
    );
  }

  Widget _buildListAgents() {
    return Container(
      child: FutureBuilder<AgentResponse>(
        future: futureAgents,
        builder: (BuildContext context, AsyncSnapshot<AgentResponse> snapshot) {
          if (snapshot.hasError) {
            return _buildError();
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return _buildLoading();
          }
          if (snapshot.hasData) {
            return _buildSuccess(snapshot.data!);
          }
          return _buildLoading();
        },
      ),
    );
  }

  Widget _buildError() {
    return Center(
      child: Text("Error loading agents"),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccess(AgentResponse agentResponse) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8, // Aspect ratio for each item
      ),
      itemCount: agentResponse.agent.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildItem(agentResponse.agent[index]);
      },
    );
  }

  Widget _buildItem(Agent agent) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailAgentsScreen(uuid: agent.uuid),
          )),
      child: Card(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              child: Image.network(
                agent.displayIcon,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8),
            Text(
              agent.displayName + agent.developerName,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
