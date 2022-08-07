

import 'package:dinder/Common/NumberInputWidget.dart';
import 'package:dinder/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Common/NavButton.dart';
import '../Common/NavigateButton.dart';
import '../Common/background_wave.dart';

class CodeEntryPage extends StatefulWidget {
  const CodeEntryPage({Key? key}) : super(key: key);


  @override
  _CodeEntryPageState createState() => _CodeEntryPageState();
}

class _CodeEntryPageState extends State<CodeEntryPage> {

  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    myController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    myController.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    print('text field: ${myController.text}');
  }

  String _getText() {
    return myController.text;
  }


  @override
  Widget build(BuildContext context) {
    var pageWidth = MediaQuery.of(context).size.width / 1.4;

    return Scaffold(
      appBar: AppBar(
        title: Text("Dinder"),
        backgroundColor: AppTheme.kColor1,
      ),
      body: Container(
        child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
            setState(() {});
          },
          child: Scaffold(
           body: Padding(
             padding: EdgeInsets.symmetric(vertical: 0, horizontal: 60),
             child: Container(

               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   const Text(
                       "Wanting to Vote?",
                     style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 40
                     ),
                   ),
                   TextField(
                     controller: myController,
                     decoration: const InputDecoration(
                         border: UnderlineInputBorder(),
                         labelText: "Enter in Room Code"
                     ),
                     keyboardType: TextInputType.phone,
                     inputFormatters: <TextInputFormatter>[
                       FilteringTextInputFormatter.digitsOnly
                     ], // Only numbers can be entered
                   ),
                   //NavigateButton(context),
                   NavButton(inputText: "Enter Room", navRoute: "/VotingPage", backendCall: "JOIN", optionlText: myController.text),
                 ],
               ),
             ),
           ),
          ),
      ),
    ),
    );

    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("Dinder"),
    //     backgroundColor: AppTheme.kColor1,
    //   ),
    //   body: Container(
    //     child: GestureDetector(
    //       onTap: () {
    //         FocusScopeNode currentFocus = FocusScope.of(context);
    //         if (!currentFocus.hasPrimaryFocus) {
    //           currentFocus.unfocus();
    //         }
    //         setState(() {});
    //       },
    //       child: Scaffold(
    //        body: Padding(
    //          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 60),
    //          child: Container(
    //
    //            child: Column(
    //              mainAxisAlignment: MainAxisAlignment.center,
    //              crossAxisAlignment: CrossAxisAlignment.center,
    //              children: [
    //                const Text(
    //                    "Wanting to Vote?",
    //                  style: TextStyle(
    //                    fontWeight: FontWeight.bold,
    //                    fontSize: 40
    //                  ),
    //                ),
    //                TextField(
    //                  decoration: const InputDecoration(
    //                      border: UnderlineInputBorder(),
    //                      labelText: "Enter in Room Code"
    //                  ),
    //                  keyboardType: TextInputType.phone,
    //                  inputFormatters: <TextInputFormatter>[
    //                    FilteringTextInputFormatter.digitsOnly
    //                  ], // Only numbers can be entered
    //                ),
    //                //NavigateButton(context),
    //                NavButton(inputText: "Enter Room", navRoute: "/VotingPage"),
    //
    //              ],
    //            ),
    //          ),
    //        ),
    //       ),
    //     ),
    //   ),
    // );
  }
}



Widget NextButton(
    BuildContext context) {
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

/*
TextField(
decoration: InputDecoration(
border: UnderlineInputBorder(),
labelText: "Enter in your code"
),
keyboardType: TextInputType.phone,
inputFormatters: <TextInputFormatter>[
FilteringTextInputFormatter.digitsOnly
], // Only numbers can be entered
),
*/