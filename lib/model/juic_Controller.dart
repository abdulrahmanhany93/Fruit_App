import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:fruit_app/Model/Juice.dart';

class JuiceController extends ChangeNotifier {
  Map<String, List<Juice>> product = {};
  Map categories = {};
  bool dataComplete = false;

  getData() async {
    DocumentSnapshot<Map<String, dynamic>> juice = await FirebaseFirestore
        .instance
        .collection('fruits')
        .doc('juices')
        .get(); //get juice data
    await FirebaseFirestore.instance
        .collection('fruits')
        .doc('categories')
        .get() // get juice categories
        .then((value) => categories = value.data()!);
    categories.forEach((key, value) {
      product[key] = [];
    }); // make add categories as keys into product map
    juice.data()!.values.forEach((value) {
      product[value[0]]!.add(Juice(value[1], value[2], value[3], value[4]));
    }); // add every juice data into object then add it to it's category
    dataComplete=true;
    notifyListeners();

  }
}
