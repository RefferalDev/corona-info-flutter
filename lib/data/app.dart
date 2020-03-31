import 'package:corona/screens/global_screen.dart';
import 'package:corona/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

List<Map<String, Object>> pages = [
  {'page': HomeScreen(), 'title': 'Home', 'icon': Icon(Icons.home)},
  {'page': GlobalScreen(), 'title': 'Global', 'icon': Icon(Icons.public)}
];
