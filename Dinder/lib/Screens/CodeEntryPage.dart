import 'package:dinder/Common/NumberInputWidget.dart';
import 'package:dinder/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CodeEntryPage extends StatefulWidget {
  const CodeEntryPage({Key? key}) : super(key: key);

  @override
  _CodeEntryPageState createState() => _CodeEntryPageState();
}

class _CodeEntryPageState extends State<CodeEntryPage> {
  @override
  Widget build(BuildContext context) {
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
           body: Column(
             children: [
               Text(
                   "Enter in Room Code",
                 style: TextStyle(
                   fontWeight: FontWeight.bold,
                 ),
               ),
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
             ],
           ),
          ),
        ),
      ),
    );
  }
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