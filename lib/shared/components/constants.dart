
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
const appBackground = Color(0xffdaecea);
const duration = Duration(milliseconds: 500);
const curve = Curves.ease;
final homePageController = PageController(initialPage: 0);
final navigationPageController = PageController(initialPage: 0);

final List content = [
  [
    CircleAvatar(
      radius: 30,
      backgroundImage: NetworkImage(
          'https://i.ibb.co/5cFkd4T/122668576-3540912739308597-6214632756950452822-n.jpg'),
    ),
    Text(
      'Food Courier',
      style: TextStyle(
          fontSize: 17, color: Colors.black, fontWeight: FontWeight.normal),
    ),
    Text(
      'Abdul-Rahman Hany',
      style: TextStyle(
          fontSize: 19, color: Colors.black, fontWeight: FontWeight.w700),
    ),
    Container(
      width: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Color(0xffE7B15E)),
      child: Center(
        child: Text(
          'Call',
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
    )
  ],
  [
    Icon(
      Icons.alarm,
      color: Colors.amber,
      size: 50,
    ),
    Text(
      'Delivery Time',
      style: TextStyle(
          fontSize: 17, color: Colors.black, fontWeight: FontWeight.normal),
    ),
    Text(
      '30 Minutes',
      style: TextStyle(
          fontSize: 20, color: Colors.black, fontWeight: FontWeight.w700),
    ),
    SizedBox()
  ],
  [
    Icon(
      Icons.my_location_rounded,
      color: Colors.amber,
      size: 50,
    ),
    Text(
      'Delivery Address',
      style: TextStyle(
          fontSize: 17, color: Colors.black, fontWeight: FontWeight.normal),
    ),
    Text(
      'Oclahoma 9832',
      style: TextStyle(
          fontSize: 20, color: Colors.black, fontWeight: FontWeight.w700),
    ),
    SizedBox()
  ]
];
