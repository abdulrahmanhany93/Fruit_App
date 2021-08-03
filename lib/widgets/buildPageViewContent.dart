import 'package:flutter/material.dart';
import 'package:fruit_app/Model/juic_Controller.dart';
import 'package:fruit_app/shared/components/constants.dart';
import 'package:fruit_app/widgets/buildJuiceContainer.dart';
import 'package:provider/provider.dart';

class BuildPageViewContent extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Consumer<JuiceController>(
      builder: (context, fruit, child) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.5,
          child: PageView.builder(
            itemCount: fruit.categories.length,
            physics: NeverScrollableScrollPhysics(),
            controller: homePageController,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, pageViewIndex) {
              return ListView.builder(
                itemCount: fruit.product.values.elementAt(pageViewIndex).length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var products = fruit.product.values.elementAt(pageViewIndex)[index];
                  return GestureDetector(
                    child: BuildJuiceContainer(products),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
