import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWithMarker extends StatefulWidget {
  const GoogleMapWithMarker({
    Key key,
    @required LatLng center,
  })  : _center = center,
        super(key: key);

  final LatLng _center;

  @override
  _GoogleMapWithMarkerState createState() => _GoogleMapWithMarkerState();
}

class _GoogleMapWithMarkerState extends State<GoogleMapWithMarker> {
  Completer<GoogleMapController> _controller = Completer();

  final Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    setState(
      () => _markers.add(
        Marker(
            markerId: MarkerId(widget._center.toString()),
            position: widget._center,
            infoWindow:
                InfoWindow(title: 'Tulungagung', snippet: 'Kota Tulungagung'),
            icon: BitmapDescriptor.defaultMarker),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      mapType: MapType.normal,
      markers: _markers,
      initialCameraPosition: CameraPosition(
        target: widget._center,
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
