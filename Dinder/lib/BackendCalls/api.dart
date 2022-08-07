import 'package:http/http.dart' as http;

import '../globals.dart' as globals;

import 'dart:convert';
import 'dart:io';

// tests
void main() async{
  //print("resp: " + await Alive());
  print(await CreateRoom("1234"));

}

// Create a room, put the user in the room, get a list of restaurants back
Future<String> Alive() async {
  var uri = Uri.http(globals.SERVER_ENDPOINT, '/alive', null);
  final response = await http.get(
    uri,
    headers: {"Accept": "application/json"},
  );
  if (response.statusCode == 200) {
    return response.body;
  } else {
    return "";
  }
}

// Create a room, put the user in the room, get a list of restaurants back
Future<Object> CreateRoom(String userID) async {
  var queryParams = {
    'user': userID,
  };
  var uri = Uri.http(globals.SERVER_ENDPOINT, '/create', queryParams);
  final response = await http.get(
    uri,
    headers: {"Accept": "application/json"},
  );
  if (response.statusCode == 200) {
    print(json.decode(response.body));
    return response.body;
  } else {
    return <String>[];
  }
}