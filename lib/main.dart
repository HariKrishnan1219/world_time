import 'package:flutter/material.dart';
import 'package:world_time/pages/Home.dart';
import 'package:world_time/pages/Loading.dart';
import 'package:world_time/pages/Location.dart';
void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/' : (context) => Loading(),
      '/home' : (context) => Home(),
      '/location' : (context) => Location(),
    },
  ));
}

