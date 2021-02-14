import 'package:flutter/material.dart';
import 'package:world_time_app/pages/home.dart';
import 'package:world_time_app/pages/choose_location.dart';
import 'package:world_time_app/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/': (context) => LoadingScreen(),
      '/Home': (context) => Home(),
      '/choose-location': (context) => ChooseLocation(),
    },
  ));
}
