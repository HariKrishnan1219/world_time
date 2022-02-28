import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class WorldTime
{
  late String time;
  String url;
  String flag;
  String location;
  late bool isDay;
  WorldTime({required this.location,required this.url,required this.flag});
  Future<void> getTime() async {
    try {
      Response response = await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      print(response.body);
      Map data = jsonDecode(response.body);
      String dt = data['datetime'];
      print(dt);
      String off_set = data['utc_offset'].substring(1, 3);
      print(off_set);
      DateTime now = DateTime.parse(dt);
      print(now);
      now.add(Duration(hours: int.parse(off_set)));
      print(now);
      isDay = now.hour > 6 && now.hour < 19 ? true : false;
      time = DateFormat.jm().format(now);
      print(time);
    }
    catch(e)
    {
      print('Could not load data');
    }
  }

}