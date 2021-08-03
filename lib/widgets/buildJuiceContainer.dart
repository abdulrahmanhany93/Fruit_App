import 'package:flutter/material.dart';
import 'package:fruit_app/Model/Juice.dart';
import 'package:fruit_app/modules/juicProfile/juice_page.dart';
import 'package:fruit_app/transitions/custom_page_route.dart';

class BuildJuiceContainer extends StatelessWidget {
  final Juice juice;

  const BuildJuiceContainer(this.juice);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, CustomRoute(JuicePage(juice))),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 60),
            height: MediaQuery.of(context).size.height * 0.35,
            width: MediaQuery.of(context).size.height * 0.19,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  juice.juiceName,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.normal,
                      height: 3),
                ),
                Text(
                  '\$ ${juice.juicePrice}',
                  style: const TextStyle(
                    color: Color(0xFFEFAD27),
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(
                  height: 15,
                )
              ],
            ),
          ),
          Positioned(
              bottom: MediaQuery.of(context).size.height * 0.19,
              child: Hero(
                  tag: juice,
                  child: FadeInImage(
                      image: NetworkImage(
                        juice.juiceImage,
                      ),
                      placeholder: AssetImage('assets/load.gif'),
                   alignment: Alignment.bottomCenter,
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.height * 0.21)))
        ],
      ),
    );
  }
}
