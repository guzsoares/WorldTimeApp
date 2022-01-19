import 'package:flutter/material.dart';
import 'package:timeclock1/services/worldtime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'loading';

  void setupWorldTime() async{
    WorldTime country1 = WorldTime(location: 'London', flag: 'uk.png', url: 'Europe/London');
    await country1.getData();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': country1.location,
      'flag': country1.flag,
      'time': country1.time,
      'isDay': country1.isDay,
    });

  }


  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[600],
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 60.0
        )
      ),
      );
  }
}
