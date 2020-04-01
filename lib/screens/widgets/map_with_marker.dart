import 'dart:async';

import 'package:corona/models/indo_victims.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWithMarker extends StatelessWidget {
  final Completer<GoogleMapController> _controller = Completer();
  final LatLng _jakarta = LatLng(-6.211540, 106.845169);
  final Set<Marker> _markers = {};
  final List<IndoVictims> indoLocation;

  final BitmapDescriptor markerIcon;

  GoogleMapWithMarker({this.indoLocation, this.markerIcon}) {
    initializeIndoVictims();
  }
  
  void initializeIndoVictims() {
    if (indoLocation != null) {
      indoLocation.forEach((element) {
        final _attr = element.attributes;
        print('Data = ${_attr.provinsi}');
        final _latlng = LatLng(_attr.latitude, _attr.longitude);
        _markers.add(
          Marker(
              markerId: MarkerId(_latlng.toString()),
              position: _latlng,
              infoWindow: InfoWindow(
                  title: _attr.provinsi,
                  snippet:
                      '(Positif : ${_attr.kasusPosi} - Sembuh : ${_attr.kasusSemb} - Meninggal : ${_attr.kasusSemb})'),
              icon: markerIcon),
        );
      });
    } else {
      print('DATA KOSONG');
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      mapType: MapType.normal,
      markers: _markers,
      initialCameraPosition: CameraPosition(
        target: _jakarta,
        zoom: 5.0,
      ),
      gestureRecognizers: Set()
        ..add(Factory<PanGestureRecognizer>(() => PanGestureRecognizer()))
        ..add(Factory<ScaleGestureRecognizer>(() => ScaleGestureRecognizer()))
        ..add(Factory<TapGestureRecognizer>(() => TapGestureRecognizer()))
        ..add(Factory<VerticalDragGestureRecognizer>(
            () => VerticalDragGestureRecognizer())),
    );
  }
}
