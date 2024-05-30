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
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 2.0,
                ),
                itemCount: agent.abilities.length,
                itemBuilder: (context, index) {
                  var ability = agent.abilities[index];
                  return Card(
                    color: Colors.purple[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(ability.displayIcon,
                              height: 40, width: 40),
                          SizedBox(height: 5.0),
                          Text(
                            ability.displayName,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
