import 'package:google_maps_flutter/google_maps_flutter.dart';

final initialCameraPosition = CameraPosition(target: storeLocation, zoom: 9);
final CameraTargetBounds cameraTargetBounds = CameraTargetBounds(LatLngBounds(
    northeast: LatLng(storeLocation.latitude, storeLocation.longitude),
    southwest: LatLng(clientLocation.latitude, clientLocation.longitude)));
late LatLng clientLocation;
final LatLng storeLocation = LatLng(30.0131, 31.2089);
