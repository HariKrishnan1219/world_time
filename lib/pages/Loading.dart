import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void setUpTime() async{
    WorldTime w =  WorldTime(location: 'London', url: 'Europe/London', flag: 'London.png');
    await w.getTime();

    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location' : w.location,
      'time' : w.time,
      'flag' : w.flag,
      'isDay' : w.isDay,
    });
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    setUpTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      body: Center(

        child:SpinKitThreeInOut(
          color: Colors.white,
          size: 50.0,
        ),
      )
    );
  }
}
