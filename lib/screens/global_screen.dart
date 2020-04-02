import 'package:corona/bloc/global_bloc.dart';
import 'package:corona/models/global.dart';
import 'package:corona/models/global_total.dart';
import 'package:corona/repositories/corona_repository.dart';
import 'package:corona/screens/widgets/map_with_marker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class GlobalScreen extends StatefulWidget {
  @override
  _GlobalScreenState createState() => _GlobalScreenState();
}

class _GlobalScreenState extends State<GlobalScreen> {
  BitmapDescriptor _markerIcon;
  GlobalBloc _bloc;

  @override
  void initState() {
    initializeMarker();
    super.initState();
    final _repository = Provider.of<CoronaRepository>(context, listen: false);
    _bloc = GlobalBloc(_repository);
  }

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
      bottom: -50,
      left: 0,
      right: 0,
      child: StreamBuilder<List<Global>>(
          stream: _bloc.globalStream,
          builder: (context, snapshot) {
            return snapshot.hasData
                ? GoogleMapWithMarker(
                    globalLocation: snapshot.data,
                    markerIcon: _markerIcon,
                    mapZoom: 0.0,
                  )
                : GoogleMapWithMarker(
                    mapZoom: 0.0,
                  );
          }),
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
              StreamBuilder<GlobalTotal>(
                stream: _bloc.positifStream,
                builder: (context, snapshot) {
                  return _buildItemVictim(
                      title: snapshot.hasData ? snapshot.data.value : '0',
                      note: 'Positif',
                      color: Colors.blue);
                },
              ),
              StreamBuilder<GlobalTotal>(
                stream: _bloc.recoveredStream,
                builder: (context, snapshot) {
                  return _buildItemVictim(
                      title: snapshot.hasData ? snapshot.data.value : '0',
                      note: 'Sembuh',
                      color: Colors.green);
                },
              ),
              StreamBuilder<GlobalTotal>(
                stream: _bloc.diedStream,
                builder: (context, snapshot) {
                  return _buildItemVictim(
                      title: snapshot.hasData ? snapshot.data.value : '0',
                      note: 'Meninggal',
                      color: Colors.red);
                },
              )
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

  Future<void> initializeMarker() async {
    BitmapDescriptor.fromAssetImage(ImageConfiguration(devicePixelRatio: 2.5),
            'assets/images/marker.png')
        .then((value) => _markerIcon = value);
  }
}
