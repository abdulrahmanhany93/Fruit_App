import 'package:flutter/material.dart';
import 'package:fruit_app/Model/googleMap/MarkerBuilder.dart';
import 'package:fruit_app/Model/googleMap/mapBuilder.dart';
import 'package:fruit_app/shared/components/constants.dart';
import 'package:fruit_app/widgets/buildLocationContainer.dart';
import 'package:fruit_app/widgets/buildPopButton.dart';
import 'package:provider/provider.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    MapBuilder map = Provider.of<MapBuilder>(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: BuildPopButton(Icons.arrow_back_ios),
        leadingWidth: 65,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Track Order',
          style: TextStyle(
              fontSize: 25, color: Colors.black, fontWeight: FontWeight.w700),
        ),
      ),
      body: Stack(
        children: [
          FutureBuilder(
            future: map.buildMap(),
            builder: (BuildContext context, AsyncSnapshot shot) {
              if (shot.hasData) {
                return shot.data;
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
          Positioned(
              top: height * 0.7,
              child: BuildLocationContainer(
                  height: height, width: width, content: content)),
        ],
      ),
    );
  }

  @override

  @override
  void initState() {
    super.initState();
    MarkerBuilder.getMarkerImages();

  }

  @override
  void dispose() {
    MapBuilder().controllerDispose();
    super.dispose();
  }
}
