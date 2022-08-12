import 'package:api_call_simulation/routes/routes.dart';
import 'package:api_call_simulation/screens/delete_request.dart';
import 'package:api_call_simulation/screens/get_request.dart';
import 'package:api_call_simulation/screens/home.dart';
import 'package:api_call_simulation/screens/post_request.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: home,
    routes: {
      home: (context) => const HomeScreen(),
      getRequest: (context) => const GetRequest(),
      postRequest: (context) => const PostRequest(),
      deleteRequest: (context) => const DeleteRequest(),
    },
  ));
}
