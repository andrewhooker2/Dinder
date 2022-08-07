import 'package:dinder/Screens/CodeEntryPage.dart';
import 'package:dinder/Screens/LandingPage.dart';
import 'package:dinder/Screens/ResultsPage.dart';
import 'package:dinder/Screens/VotingPage.dart';
import 'package:flutter/material.dart';

import 'Screens/ConfigurationPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primaryColor: kDarkGreen,
      //   scaffoldBackgroundColor: kOffWhite,
      // ),
      title: 'Dinder',
      initialRoute: "/CodeEntryPage",

      //This is where you will put the different pages we can navigate to with the progject
      routes: {
        "/LandingPage": (context) => LandingPage(),
        "/ResultsPage": (context) => ResultsPage(),
        "/CodeEntryPage": (context) => CodeEntryPage(),
        "/VotingPage": (context) => VotingPage(),
        "/ConfigruationPage": (context) => ConfigurationPage(),
      },
    );
  }
}