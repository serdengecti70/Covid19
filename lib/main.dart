import 'package:flutter/material.dart';
import 'package:covid_19/screens/loading_screen.dart';
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    ));
}

