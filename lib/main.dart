import 'package:flutter/material.dart';
import 'package:practice/timePages/choose_location.dart';
import 'package:practice/timePages/loading.dart';
import 'package:practice/timePages/home.dart';

// import 'timePages/home.dart';
void main()=>runApp(MaterialApp(
  initialRoute: '/loading',
  routes: {
    '/home':(context) => Home(),
    '/loading':(context) => Loading(),
    '/choose_location':(context) => ChooseLocation()
  },
));