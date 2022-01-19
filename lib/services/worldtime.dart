import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  late String location; // location for screen
  late String time; // time for location
  late String flag; // url to flag
  late String url; // location
  late bool isDay;

  WorldTime({required this.location, required this.flag,required this.url});

  Future<void> getData() async {


    try {
      Response response = await get(Uri.http('worldtimeapi.org', '/api/timezone/$url' ));
      Map data = jsonDecode(response.body);


      // get data

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      // transform to a date
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));


      isDay = now.hour > 6 && now.hour < 19 ? true : false;
      time = DateFormat.jm().format(now);

    }
    catch (e){
      print('caught error: $e');
      time = 'could not get time data';
    }
  }

}