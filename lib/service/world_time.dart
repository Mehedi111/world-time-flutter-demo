
import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime{
  String location;
  String flag;
  String time;
  String url;
  bool isDayTime = false;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getData() async {
    try {
      Response response = await get(
              Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      String dateTime = data["datetime"];

      // get properties from json
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      // create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false ;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print(e);
      time = "Could not get world time";
    }
    print("get reponse $time");

  }
}