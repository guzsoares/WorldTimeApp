import 'package:flutter/material.dart';
import 'package:timeclock1/pages/home.dart';
import 'package:timeclock1/pages/loading.dart';
import 'package:timeclock1/pages/locations.dart';

void main() {
  runApp( MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => Locations(),
    },
  ));
}
