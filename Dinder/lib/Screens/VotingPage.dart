import 'package:flutter/material.dart';
import '../Common/background_curve_widget.dart';
import '../Common/background_wave.dart';
import '../Common/card_stack_widget.dart';

class VotingPage extends StatefulWidget {
  const VotingPage({Key? key}) : super(key: key);

  @override
  _VotingPageState createState() => _VotingPageState();
}

class _VotingPageState extends State<VotingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: Stack(
        children: [
          BackgroundWave(height: 150, text: "12864", offsetX: 35, offsetY: 10, textSize: 76),
          CardsStackWidget(),
          Positioned(
            left: 5,
            top: 50,
            width: 40,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).pop();
              },

              backgroundColor: Colors.black,
              child: const Icon(Icons.arrow_back),
            ),
          )

        ],
      ),
    );
  }
}
