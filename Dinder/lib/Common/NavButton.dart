import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../BackendCalls/api.dart' as backend;
import '../globals.dart' as globals;

class NavButton extends StatefulWidget {
  //const CustomButton({Key? key}) : super(key: key);
  NavButton(
      {super.key, required this.inputText, required this.navRoute, required this.backendCall, this.optionlText = "abc"});

  final String inputText;
  final String navRoute;
  final String backendCall;
  String optionlText;

  //Color buttonColor;

  @override
  _NavButtonState createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.4,
      height: 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      /// Needing to add Conditional logic
      child: ElevatedButton(
        onPressed: () {
          if (widget.backendCall == "CREATE") {
            backend.CreateRoom(globals.DeviceID);
          } else if (widget.backendCall == "JOIN"){
            backend.JoinRoom(globals.DeviceID, globals.CurrentRoom);
          }
          Navigator.pushNamed(context, widget.navRoute);
        },
        child: Text(
          widget.inputText,
        ),
      ),
    );
  }
}