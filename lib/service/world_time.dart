import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String location;
  String time;
  String flag;
  String url;
  WorldTime({this.location, this.flag, this.url});
  Future<void> getData() async {
    Response response = await get('http://worldtimeapi.org/api/timezone/$url');
    // print(response.body);
    Map data = jsonDecode(response.body);
    //print(data);
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1, 3);
    String restoffset = data['utc_offset'].substring(4, 6);
    // print(offset);
    DateTime now = DateTime.parse(datetime);
    now = now.add(
        Duration(hours: int.parse(offset), minutes: int.parse(restoffset)));
    time = now.toString();
  }
}
