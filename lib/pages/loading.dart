import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:world_time/service/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  var time = "Loading";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWorldTimeData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: SafeArea(child: Padding(
        padding: EdgeInsets.all(50),
        child: Center(
          child: Center(
              child: SpinKitCircle(
                color: Colors.white,
                size: 50.0,
              )
          ),
        ),
      )),
    );
  }

  void getWorldTimeData() async {
    WorldTime worldTime = WorldTime(location: "Berlin", flag: 'germany.png', url: 'Europe/Berlin');
    await worldTime.getData();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location' : worldTime.location,
      'flag': worldTime.flag,
      'time': worldTime.time,
      'isDayTime': worldTime.isDayTime
    });
  }
}
