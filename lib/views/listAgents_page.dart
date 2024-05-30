import 'package:flutter/material.dart';
import '../services/apiAgent_service.dart';
import '../models/agent_model.dart';
import '../views/detailAgents_page.dart';

class ListAgentsScreen extends StatefulWidget {
  @override
  _ListAgentsScreenState createState() => _ListAgentsScreenState();
}

class _ListAgentsScreenState extends State<ListAgentsScreen> {
  late Future<List<Agent>> futureAgents;

  @override
  void initState() {
    super.initState();
    futureAgents = AgentService().fetchAgents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Valorant Agents',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple[300],
      ),
      body: FutureBuilder<List<Agent>>(
        future: futureAgents,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No agents found'));
          } else {
            List<Agent> agents = snapshot.data!;
            return ListView.builder(
              itemCount: agents.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(agents[index].displayIcon),
                  title: Text(agents[index].displayName),
                  subtitle: Text(agents[index].developerName),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            AgentDetailPage(agent: agents[index]),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
