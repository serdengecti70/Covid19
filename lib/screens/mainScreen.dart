import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  final covidData;

  MainScreen(this.covidData);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String _date;
  Map<String, dynamic> _globalData;
  List _countryData;

  void dataFromApi(covidData) async {
    _date = covidData["Date"];
    _globalData = covidData["Global"];
    _countryData = covidData["Countries"];
    _countryData.add(_globalData);
  }

  @override
  void initState() {
    super.initState();
    dataFromApi(widget.covidData);
  }

  @override
  Widget build(BuildContext context) {
    print(_date);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_date),
      ),
      body: ListView.separated(
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemCount: _countryData.length,
          itemBuilder: (BuildContext context, int index) {
            return ShowCard(_countryData[index]);
          }),
    );
  }
}

class ShowCard extends StatelessWidget {
  ShowCard(this.countryData);

  final Map<String, dynamic> countryData;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: <Widget>[
        Text("${countryData["Country"]}",
        style: kTextStyle,),

        ///firstt Linee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ShowText(
              tag: "NewConfirmed",
              content: countryData["NewConfirmed"],
            ),
            ShowText(
              tag: "Total",
              content: countryData["TotalConfirmed"],
            ),
          ],
        ),
        ////Second line
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ShowText(
              tag: "Deaths",
              content: countryData["TotalDeaths"],
            ),
            ShowText(
              tag: "Recovered",
              content: countryData["TotalRecovered"],
            ),
          ],
        ),
      ],
    ));
  }
}

class ShowText extends StatelessWidget {
  ShowText({this.tag, this.content});

  final String tag;
  final int content;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          "$tag : $content",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}

TextStyle kTextStyle = TextStyle(
  fontSize: 25.0,
);
