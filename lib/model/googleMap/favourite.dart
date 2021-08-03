import 'package:flutter/cupertino.dart';
import 'package:fruit_app/Model/Juice.dart';

class FavouriteController extends ChangeNotifier {
  late Juice favouriteJuice;
   List<Juice> favourite = [];

  addToFavourite(Juice juice) {
    if (isFavourite(juice)) {
      favourite.removeWhere((element) => element == juice);
      notifyListeners();
    } else {
      favourite.add(juice);
      notifyListeners();
    }
  }

  bool isFavourite(Juice juice) {
    return favourite.any((element) => element == juice);
  }
}
