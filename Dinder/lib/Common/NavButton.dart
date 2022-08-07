import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class NavButton extends StatefulWidget {
  //const CustomButton({Key? key}) : super(key: key);
  const NavButton(
      {super.key, required this.inputText, required this.navRoute});

  final String inputText;
  final String navRoute;

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
          Navigator.pushNamed(context, widget.navRoute);
        },
        child: Text(
          widget.inputText,
        ),
      ),
    );
  }
}