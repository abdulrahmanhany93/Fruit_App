import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruit_app/Model/googleMap/MarkerBuilder.dart';
import 'package:fruit_app/Model/googleMap/mapStyleBuilder.dart';
import 'package:fruit_app/Model/googleMap/polyLinesBuilder.dart';
import 'package:fruit_app/Model/googleMap/variables.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapBuilder extends ChangeNotifier {
  late GoogleMapController googleMapController;
  final Completer<GoogleMapController> completer = Completer();

  late bool mapComplete = false;

  buildGoogleMap() {
    return GoogleMap(
      initialCameraPosition: initialCameraPosition,
      mapType: MapType.normal,
      myLocationEnabled: false,
      myLocationButtonEnabled: false,
      markers: MarkerBuilder.markers,
      polylines: PolyLinesBuilder.polyLine,
      minMaxZoomPreference: MinMaxZoomPreference(13, 16),
      rotateGesturesEnabled: false,
      onMapCreated: (controller) async {
        googleMapController = controller;
        String style = await MapStyleBuilder().getMapStyle();
        googleMapController.setMapStyle(style);
        if (completer.isCompleted) {
          googleMapController.animateCamera(CameraUpdate.zoomIn());
          Timer(Duration(seconds: 1), () {
            googleMapController
                .animateCamera(CameraUpdate.newLatLngZoom(clientLocation, 20));
          });
        }
      },
    );
  }

  _checkMap() async {
    bool _check = await GeolocatorPlatform.instance.isLocationServiceEnabled();
    await getCurrentLocation();
    if (_check) {
      MarkerBuilder().addMarker(clientLocation, storeLocation);
      PolyLinesBuilder().setPolyLines();
      return buildGoogleMap();
    } else {
      GeolocatorPlatform.instance.requestPermission();
      return Center(
          child: Text(
        'Please Enable Location',
        style: TextStyle(fontSize: 25),
      ));
    }
  }

  buildMap() {
    return _checkMap();
  }

  getCurrentLocation() {
    GeolocatorPlatform.instance.getCurrentPosition().then((currentPosition) =>
        clientLocation =
            LatLng(currentPosition.latitude, currentPosition.longitude));

    notifyListeners();
  }

  controllerDispose() {
    googleMapController.dispose();
    mapComplete = true;
    notifyListeners();
  }
}
