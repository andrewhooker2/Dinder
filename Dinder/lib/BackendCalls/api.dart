import 'package:http/http.dart' as http;

import '../globals.dart' as globals;
import '../Model/response.dart' as model;

import 'dart:convert';
import 'dart:io';

// tests
void main() async{
  //print("resp: " + await Alive());
  //print(await CreateRoom("1234"));
}

// Create a room, put the user in the room, get a list of restaurants back
Future<String> Alive() async {
  var uri = Uri.http(globals.SERVER_ENDPOINT, '/alive', null);
  final response = await http.get(
    uri,
    headers: {"Accept": "application/json"},
  );
  if (response.statusCode == 200) {
    return jsonDecode(response.body)['roomID'];
  } else {
    return "";
  }
}

// Create a room, put the user in the room, get a list of restaurants back
Future<String> CreateRoom(String userID) async {
  var queryParams = {
    'user': userID,
  };
  var uri = Uri.http(globals.SERVER_ENDPOINT, '/create', queryParams);
  final response = await http.get(
    uri,
    headers: {"Accept": "application/json"},
  );
  if (response.statusCode == 200) {
    return jsonDecode(response.body)['roomID'];
  } else {
    return "";
  }
}

// Remove a user from a room
Future<void> LeaveRoom(String userID, String roomID) async {
  var queryParams = {
    'user': userID,
    'room': roomID,
  };
  var uri = Uri.http(globals.SERVER_ENDPOINT, '/leave', queryParams);
  http.get(
    uri,
    headers: {"Accept": "application/json"},
  );
}

// Have a user vote for a restaurant
Future<model.Response> SwipeRight(String restaurant, String roomID) async {
  var queryParams = {
    'restaurant': restaurant,
    'room': roomID,
  };
  var uri = Uri.http(globals.SERVER_ENDPOINT, '/swipeRight', queryParams);
  final response = await http.get(
    uri,
    headers: {"Accept": "application/json"},
  );

  return model.Response.fromJson(jsonDecode(response.body));
}

// Have a user vote for a restaurant
Future<model.Response> SwipeLeft(String roomID) async {
  var queryParams = {
    'room': roomID,
  };
  var uri = Uri.http(globals.SERVER_ENDPOINT, '/swipeLeft', queryParams);
  final response = await http.get(
    uri,
    headers: {"Accept": "application/json"},
  );

  return model.Response.fromJson(jsonDecode(response.body));
}