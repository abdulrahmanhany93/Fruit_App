import 'package:flutter/material.dart';
import 'package:fruit_app/Model/juic_Controller.dart';
import 'package:fruit_app/modules/cart/cart.dart';
import 'package:fruit_app/modules/favourite/favourite.dart';
import 'package:fruit_app/modules/home/home_page.dart';
import 'package:fruit_app/modules/location/location.dart';
import 'package:fruit_app/shared/components/constants.dart';
import 'package:provider/provider.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<JuiceController>(
      builder: (context, fruit, widget) {
        return Scaffold(
          body: PageView(
            children: [HomePage(fruit), Cart(), Favourite()],
            controller: navigationPageController,
            physics: NeverScrollableScrollPhysics(),
          ),
          bottomNavigationBar: Container(
              decoration: BoxDecoration(
                color: Color(0xffFFFFFF),
                borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(50), right: Radius.circular(50)),
              ),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                unselectedItemColor: Colors.grey,
                currentIndex: _currentIndex,
                fixedColor: Color(0xff21f5cd),
                backgroundColor: Colors.transparent,
                elevation: 0,
                iconSize: 30,
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                  if (_currentIndex == 3) {
                    _currentIndex = 0;
                    Navigator.push(context,
                        MaterialPageRoute(builder: (__) => Location()));
                  } else {
                    navigationPageController.animateToPage(_currentIndex,
                        duration: duration, curve: curve);
                  }
                },
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home_outlined,
                      ),
                      label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.shopping_bag_outlined), label: 'Cart'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite_border), label: 'Favourite'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.navigation), label: 'Location'),
                ],
              )),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    Provider.of<JuiceController>(context,listen: false).getData();
  }
}
