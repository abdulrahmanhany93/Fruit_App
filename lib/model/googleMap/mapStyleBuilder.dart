import 'package:flutter/services.dart';

class MapStyleBuilder{
  final String _mapStyle= 'assets/mapJson/mapStyle.json';
  Future<String> getMapStyle()async{
    String x = await rootBundle.loadString(_mapStyle);
    return x;
  }
}