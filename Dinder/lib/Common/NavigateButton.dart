import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

Widget NavigateButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15),
    child: Container(
      width: MediaQuery.of(context).size.width / 1.4,
      height: MediaQuery.of(context).size.height / 11,
      decoration: BoxDecoration(
        color: AppTheme.kColor1,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, "/VotingPage");
        },
        child: Text("Join Room"),
      ),

      // child: Padding(
      //   padding: const EdgeInsets.all(12.0),
      //   child: NavigateButton(asset: image, inputText: text, route: route),
      // ),
    ),
  );
}