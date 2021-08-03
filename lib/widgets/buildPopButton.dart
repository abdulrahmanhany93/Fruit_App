import 'package:flutter/material.dart';

class BuildPopButton extends StatelessWidget {
 final IconData icon ;
 BuildPopButton(this.icon);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 7,vertical: 2),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(icon),
          iconSize: 22,
          color: Colors.black,
        ));
  }


}
