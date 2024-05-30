import 'package:flutter/material.dart';
import '../models/agent_model.dart';

class AgentDetailPage extends StatelessWidget {
  final Agent agent;

  AgentDetailPage({required this.agent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          agent.displayName,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple[300],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(agent.fullPortrait),
              SizedBox(height: 16.0),
              Text(
                "${agent.displayName} ${agent.developerName}",
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(agent.description),
              SizedBox(height: 16.0),
              Text(
                'Role: ${agent.role.displayName}',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                'Abilities:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Container(
                padding: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  color: Colors.purple[300],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: agent.abilities.map((ability) {
                    return ListTile(
                      leading: Image.network(ability.displayIcon),
                      title: Text(
                        ability.displayName,
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
