import 'package:flutter/material.dart';
import 'package:fruit_app/Model/googleMap/favourite.dart';
import 'package:fruit_app/widgets/buildFavouriteView.dart';
import 'package:provider/provider.dart';

class Favourite extends StatelessWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  var favouriteList=  Provider.of<FavouriteController>(context,listen: true).favourite;
    return Scaffold(
        body:  favouriteList.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text('Empty',style: TextStyle(fontSize: 30),),
                    ),
                    Container(
                      child: Image.asset('assets/load.gif'),
                    ),
                  ],
                ))
            : Padding(
              padding: const EdgeInsets.symmetric(vertical:15),
              child: BuildFavouriteView(list: favouriteList),
            ));
  }
}
