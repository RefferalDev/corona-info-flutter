import 'package:corona/screens/widgets/map_with_marker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GlobalScreen extends StatefulWidget {
  @override
  _GlobalScreenState createState() => _GlobalScreenState();
}

class _GlobalScreenState extends State<GlobalScreen> {
  static const LatLng _center = const LatLng(-8.0657, 111.9025);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[_buildMap(), _buildVictims()],
        ),
      ),
    );
  }

  /// build map widget
  Widget _buildMap() {
    return Positioned(
      top: 0,
      bottom: -50 ,
      left: 0,
      right: 0,
      child: GoogleMapWithMarker(center: _center),
    );
  }

  /// build victims
  Widget _buildVictims() {
    return Positioned(
      bottom: 20,
      left: 20,
      right: 20,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Color(0xffA22447).withOpacity(.05),
                offset: Offset(0, 0),
                blurRadius: 20,
                spreadRadius: 3)
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildItemVictim(
                  title: '1.414', note: 'Positif', color: Colors.blue),
              _buildItemVictim(
                  title: '75', note: 'Sembuh', color: Colors.green),
              _buildItemVictim(
                  title: '122', note: 'Meninggal', color: Colors.red)
            ],
          ),
        ),
      ),
    );
  }

  /// item of victim
  Widget _buildItemVictim({String title, String note, Color color}) {
    return Column(
      children: <Widget>[
        Text(title, style: TextStyle(color: color, fontSize: 28)),
        SizedBox(height: 5),
        Text(
          note,
          style: TextStyle(color: Colors.black, fontSize: 12),
        )
      ],
    );
  }
}
