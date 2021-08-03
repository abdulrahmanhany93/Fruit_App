import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fruit_app/Model/cart_controller.dart';
import 'package:fruit_app/Model/googleMap/favourite.dart';
import 'package:fruit_app/Model/googleMap/mapBuilder.dart';
import 'package:fruit_app/Model/juic_Controller.dart';
import 'package:fruit_app/modules/navigation/navigation.dart';
import 'package:fruit_app/shared/components/constants.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MapBuilder(),
        ),
        ChangeNotifierProvider(
          create: (_) => JuiceController(),
        ),
        ChangeNotifierProvider(
          create: (_) => CartController(),
        ),
        ChangeNotifierProvider(
          create: (_) => FavouriteController(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: appBackground),
        debugShowCheckedModeBanner: false,
        home: Navigation(),
      ),
    );
  }
}
