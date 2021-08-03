import 'package:flutter/material.dart';
import 'package:fruit_app/Model/Juice.dart';
import 'package:fruit_app/modules/juicProfile/juice_page.dart';
import 'package:fruit_app/transitions/custom_page_route.dart';
class BuildFavouriteView extends StatelessWidget {
  const BuildFavouriteView({
    Key? key,
    required this.list,
  }) : super(key: key);

  final List<Juice> list;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,childAspectRatio: 0.5,),
        scrollDirection: Axis.vertical,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.push(
                context,
                CustomRoute(JuicePage(list[index]))),
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 60),
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.height * 0.19,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        list[index].juiceName,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.normal,
                            height: 3),
                      ),
                      SizedBox(
                        height: 15,
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.15,
                  child: Hero(
                    tag: list[index],
                    child: Image.network(
                      list[index].juiceImage,
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.height * 0.21,
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}