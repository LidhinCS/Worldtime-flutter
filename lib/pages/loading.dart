import 'package:flutter/material.dart';
import 'package:worldtime/service/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'Loading';
  void setUpWorldTime() async {
    WorldTime instance =
        WorldTime(location: 'kolkata', flag: 'india.jpg', url: 'Asia/kolkata');
    await instance.getData();
    setState(() {
      time = instance.time;
    });
  }

  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(50.0),
      child: Text(time),
    ));
  }
}
