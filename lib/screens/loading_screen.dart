import 'package:covid_19/screens/mainScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:covid_19/services/networking.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  var covidData;

  Map<String, dynamic> loremIpsum = {
    "Global" : "LoremIpsum",
    "Countries" : [3,1,4],
    "Date" : "1923"
  };


  void getData() async {
    covidData = await NetworkHelper().getAllData();
    if (covidData != null) {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return MainScreen(covidData);
      }), (route) => false);
    } else {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return MainScreen(loremIpsum);
      }), (route) => false);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.amberAccent,
          child: SpinKitFadingCube(
            color: Colors.white,
            size: 100.0,
          ),
        ),
      ),
    );
  }
}
