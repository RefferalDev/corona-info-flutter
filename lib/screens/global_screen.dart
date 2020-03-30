import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GlobalScreen extends StatefulWidget {
  @override
  _GlobalScreenState createState() => _GlobalScreenState();
}

class _GlobalScreenState extends State<GlobalScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(),
      ),
    );
  }
}
