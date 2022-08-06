import 'package:flutter/material.dart';

class VotingPage extends StatefulWidget {
  const VotingPage({Key? key}) : super(key: key);

  @override
  _VotingPageState createState() => _VotingPageState();
}

class _VotingPageState extends State<VotingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("I am the voting page"),
    );
  }
}
