import 'package:dinder/Common/NavButton.dart';
import 'package:dinder/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dinder/globals.dart' as globals;

import '../Common/background_wave.dart';

class ResultsPage extends StatefulWidget {
  const ResultsPage({Key? key}) : super(key: key);

  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
          children: [
            BackgroundWave(
              height: 180,
              text: "Dinder",
            ),
            //Text("We have a winner!!!"),
            Container(
              child: Image(
                fit: BoxFit.contain,
                width: 250,
                height: 250,
                image: NetworkImage('https://exchangegwinnett.com/wp-content/uploads/2020/03/ChipotleMexicanGrills.jpeg'),
                ),
              ),

            Padding(
              padding: const EdgeInsets.all(80),
              child: Container(
                color: Colors.amberAccent,
                child: NavButton(inputText: "Finally! Go Eat!", navRoute: "/HomeScreen", backendCall: '',),

    ),
            )
          ]
      ),

    );
  }
}
