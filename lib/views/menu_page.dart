import 'package:flutter/material.dart';
import 'package:responsi_praktpm/views/listMaps_page.dart';
import 'package:responsi_praktpm/views/listAgents_page.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Column(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ListAgentsScreen()),
                      );
                    },
                    child: Text('Agents'),
                  ),
                  ElevatedButton(onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ListMapsScreen()),
                      );
                  },
                  child: Text('Maps'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
