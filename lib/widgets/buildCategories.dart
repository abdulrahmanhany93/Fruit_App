import 'package:flutter/material.dart';
import 'package:fruit_app/shared/components/constants.dart';

class BuildCategories extends StatefulWidget {
  final List category;
  final Color active = Color(0xffF6FBF9);
  final Color inactive = Colors.transparent;
  int _currentIndex = 0;

  BuildCategories({required this.category});

  @override
  _BuildCategoriesState createState() => _BuildCategoriesState();
}

class _BuildCategoriesState extends State<BuildCategories> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 60,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                widget._currentIndex = index;
              });
              homePageController.animateToPage(index,
                  duration: duration, curve: curve);
            },
            child: Container(
                width: MediaQuery.of(context).size.width * 0.3,
                decoration: BoxDecoration(
                    color: widget._currentIndex == index
                        ? widget.active
                        : widget.inactive,
                    borderRadius: BorderRadius.circular(50)),
                alignment: Alignment.center,
                child: Text(
                  widget.category[index],
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.normal),
                )),
          );
        },
        itemCount: widget.category.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
