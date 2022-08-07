import 'package:dinder/Common/NavButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({Key? key}) : super(key: key);


  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  bool switchedState1 = false;
  bool switchedState2 = false;
  bool switchedState3 = false;
  bool switchedState4 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.green,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            Text(
              "Room Configuration",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(
                  Icons.stacked_bar_chart,
                  color: Colors.green,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Room Stats",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            buildAccountOptionRow(context, "Total Restaurants", "420"),
            buildAccountOptionRow(context, "Total Voter Spaces", "69"),
            buildAccountOptionRow(context, "Estimated Wait", "15-20mins"),
            // buildAccountOptionRow(context, "Language"),
            // buildAccountOptionRow(context, "Privacy and Policy"),

            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(
                  Icons.room_preferences,
                  color: Colors.green,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Preferences",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            // buildNotificationOptionRow("", switchedState1),
            // buildNotificationOptionRow("Account Status", switchedState2),

            // Doing below until I can figure out how to pass state back to switches individually from funciton
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Fast Food",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[600]),
                  ),
                  Transform.scale(
                      scale: 0.7,
                      child: CupertinoSwitch(
                        value: switchedState1,
                        onChanged: (bool value) {
                          setState(() {
                            switchedState1 = value;
                          });
                        },
                      ))
                ],
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Sit Down Restaurants",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600]),
                ),
                Transform.scale(
                    scale: 0.7,
                    child: CupertinoSwitch(
                      value: switchedState2,
                      onChanged: (bool value) {
                        setState(() {
                          switchedState2 = value;
                        });
                      },
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Distance over 20 Miles",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600]),
                ),
                Transform.scale(
                    scale: 0.7,
                    child: CupertinoSwitch(
                      value: switchedState4,
                      onChanged: (bool value) {
                        setState(() {
                          switchedState4 = value;
                        });
                      },
                    ))
              ],
            ),



            SizedBox(
              height: 50,
            ),
            NavButton(inputText: "Start Room", navRoute: "/ResultsPage", backendCall: "CREATE", optionlText: "coconut.jpg"),
          ],
        ),
      ),
    );
  }

  Row buildNotificationOptionRow(String title, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600]),
        ),
        Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              value: isActive,
              onChanged: (bool valer) {
                setState(() {
                  isActive = valer;
                });
              },
            ))
      ],
    );
  }

  GestureDetector buildAccountOptionRow(BuildContext context, String title, String info) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Option A"),
                    Text("Option B"),
                    Text("Option C"),
                  ],
                ),
                // actions: [
                //   FlatButton(
                //       onPressed: () {
                //         Navigator.of(context).pop();
                //       },
                //       child: Text("Close")),
                // ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            Text(info)
          ],
        ),
      ),
    );
  }
}









