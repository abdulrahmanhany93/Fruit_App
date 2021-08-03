import 'package:flutter/material.dart';
import 'package:fruit_app/Model/googleMap/variables.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkerBuilder extends ChangeNotifier {
  static late BitmapDescriptor clientMark;
  static late BitmapDescriptor deliveryMark;
  static late BitmapDescriptor storeMark;
  static Set<Marker> markers = {
    Marker(
        markerId: MarkerId('_storeMark'),

        position: storeLocation)
  };

  static getMarkerImages() async {
    clientMark = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty, 'assets/marker2.png');
    deliveryMark = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty, 'assets/arrow.png');
    storeMark = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty, 'assets/marker2.png');
  }

  addMarker(LatLng clientPosition, LatLng deliveryPosition) {
    markers.addAll([
      Marker(
          markerId: MarkerId('_clientMark'),

          position: clientPosition),
      Marker(
          markerId: MarkerId('deliveryMark'),

          position: deliveryPosition)
    ]);
  }
}
