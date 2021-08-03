import 'package:flutter/material.dart';
class BuildLocationContainer extends StatelessWidget {
  const BuildLocationContainer({
    Key? key,
    required this.height,
    required this.width,
    required this.content,
  }) : super(key: key);

  final double height;
  final double width;
  final List content;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.topCenter,
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50)),
        child: ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(0),
          itemCount: content.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: content[index][0],
              title: content[index][1],
              subtitle: content[index][2],
              trailing: content[index][3],
            );
          },separatorBuilder: (context,index){
          if(index<1){
            return Divider();
          }
          else{
            return SizedBox();
          }
        },
        ));
  }
}