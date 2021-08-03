import 'package:flutter/material.dart';
import 'package:fruit_app/Model/Juice.dart';
import 'package:fruit_app/Model/googleMap/favourite.dart';
import 'package:fruit_app/widgets/buildCategories.dart';
import 'package:provider/provider.dart';

class JuicePage extends StatelessWidget {
  const JuicePage(this.juice);

  final Juice juice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: 50,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  child: IconButton(
                    alignment: Alignment.center,
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back_ios),
                    iconSize: 25,
                  )),
              Container(
                  width: 50,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: IconButton(
                    alignment: Alignment.center,
                    onPressed: () {
                      Provider.of<FavouriteController>(context,listen: false).addToFavourite(juice);
                    },
                    icon: Icon(
                        Provider.of<FavouriteController>(context).isFavourite(juice)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.grey,
                    ),
                    iconSize: 35,
                  )),
            ],
          )),
          Expanded(
            flex: 4,
            child: Align(
              child: Hero(
                tag:  juice,
                child: Image.network(
                  juice.juiceImage,
                ),
              ),
            ),
          ),
          Container(
              height: 60,
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: BuildCategories(category: ['Small', 'Medium', 'Large'])),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 25),
            title: Text(
              juice.juiceName,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.normal),
            ),
            subtitle: Text(
              '\$ ${juice.juicePrice}',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            trailing: Container(
              width: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OrderQuantity(Icons.add),
                  Text(
                    '1',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  OrderQuantity(Icons.remove)
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              title: Row(
                children: [
                  Icon(
                    Icons.star_border,
                    size: 30,
                    color: Colors.amber,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '4.5',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              subtitle: Text(
                juice.juiceDescription,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    height: 1.5),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 0),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.center,
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      'Add to Cart',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          height: 1.5),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 90,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Color(0xffFFFFFF),
                        borderRadius: BorderRadius.circular(35)),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Icon(
                          Icons.shopping_bag_outlined,
                          size: 40,
                          color: Color(0xff59e2cb),
                        ),
                        Positioned(
                          left: 20,
                          top: 0,
                          child: Container(
                            alignment: Alignment.center,
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(50)),
                            child: Text(
                              '1',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}

class OrderQuantity extends StatelessWidget  {
  const OrderQuantity(this.icon);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: Colors.white),
      child: Icon(
        icon,
        color: Colors.black,
      ),
    );
  }
}
