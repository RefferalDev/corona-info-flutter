import 'dart:async';

import 'package:corona/models/indo_victims.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWithMarker extends StatefulWidget {
  const GoogleMapWithMarker({
    Key key,
    List<IndoVictims> indoLocation,
  })  : _indoLocation = indoLocation,
        super(key: key);

  final List<IndoVictims> _indoLocation;

  @override
  _GoogleMapWithMarkerState createState() => _GoogleMapWithMarkerState();
}

class _GoogleMapWithMarkerState extends State<GoogleMapWithMarker> {
  Completer<GoogleMapController> _controller = Completer();
  final LatLng _jakarta = LatLng(-6.211540, 106.845169);

  BitmapDescriptor _markerIcon;

  final Set<Marker> _markers = {};

  @override
  void initState() {
    // initializeMarker();
    super.initState();
    if (widget._indoLocation != null) {
      initializeIndoVictims();
    }
  }

  Future<void> initializeMarker() async {
    // _markerIcon = await BitmapDescriptor.fromAssetImage(
    //   ImageConfiguration(devicePixelRatio: 2.5),
    //   'assets/images/marker.png');
    _markerIcon = await BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(12, 12)), 'assets/images/marker.png');
  }

  void initializeIndoVictims() {
    widget._indoLocation.forEach((element) {
      final _attr = element.attributes;
      final _latlng = LatLng(_attr.latitude, _attr.longitude);
      _markers.add(
        Marker(
            markerId: MarkerId(_latlng.toString()),
            position: _latlng,
            infoWindow: InfoWindow(
                title: _attr.provinsi,
                snippet:
                    '(Positif : ${_attr.kasusPosi} - Sembuh : ${_attr.kasusSemb} - Meninggal : ${_attr.kasusSemb})'),
            icon: BitmapDescriptor.defaultMarker),
      );
    });
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
