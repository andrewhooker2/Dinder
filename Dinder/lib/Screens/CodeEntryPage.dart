import 'package:dinder/Common/NumberInputWidget.dart';
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

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [


          Center(
            child:TextField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ], // Only numbers can be entered
            ),
          ),
        ],
      ),
    );
  }
}
