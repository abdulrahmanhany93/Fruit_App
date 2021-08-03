import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruit_app/Model/juic_Controller.dart';
import 'package:fruit_app/widgets/buildCategories.dart';
import 'package:fruit_app/widgets/buildPageViewContent.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final JuiceController juiceController;

  HomePage(this.juiceController);

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(vertical: 60, horizontal: 15),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Juicy',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'Sip of happy \nDelights',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '''Choose Your favourite one''',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.normal,
                  height: 3),
            ),
            BuildCategories(
              category: Provider.of<JuiceController>(context)
                  .categories
                  .keys
                  .toList(),
            ),
            BuildPageViewContent(),
          ],
        ),
      ),
    );
  }
}
