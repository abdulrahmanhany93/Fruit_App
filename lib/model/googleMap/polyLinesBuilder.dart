import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:fruit_app/Model/googleMap/variables.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PolyLinesBuilder {
  static Set<Polyline> polyLine = {};
  List<LatLng> polyLinesCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();

  setPolyLines() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        'AIzaSyABqip5Qer6FLS9Ct5sGgrufkeYOasgl2s',
        PointLatLng(storeLocation.latitude, storeLocation.longitude),
        PointLatLng(clientLocation.latitude, clientLocation.longitude));
    if (result.status == 'OK' && polyLine.isEmpty) {
      result.points.forEach((PointLatLng element) {
        polyLinesCoordinates.add(LatLng(element.latitude, element.longitude));
      });
      polyLine.add(Polyline(
          polylineId: PolylineId('1'),
          visible: true,
          width: 4,
          color: Colors.amber,
          points: polyLinesCoordinates));
    }
  }
}
