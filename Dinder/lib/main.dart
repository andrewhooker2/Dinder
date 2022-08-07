import 'package:dinder/Screens/CodeEntryPage.dart';
import 'package:dinder/Screens/HomeScreen.dart';
import 'package:dinder/Screens/ResultsPage.dart';
import 'package:dinder/Screens/VotingPage.dart';
import 'package:flutter/material.dart';

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
      initialRoute: "/HomeScreen",
      //This is where you will put the different pages we can navigate to with the progject
      routes: {
        "/HomeScreen": (context) => HomeScreen(
          durationInSeconds: 10, // this is the default value
          child: Image.asset('assets/images/chickenerdrummerstick.png')
        ),
        "/ResultsPage": (context) => ResultsPage(),
        "/CodeEntryPage": (context) => CodeEntryPage(),
        "/VotingPage": (context) => VotingPage(),
      },
    );
  }
}