import 'package:flutter/cupertino.dart';

class CustomRoute extends PageRouteBuilder {
  final Widget child;

  CustomRoute(this.child)
      : super(
            pageBuilder: (context, fAnimation, sAnimation) => child,
            transitionsBuilder: (context, fAnimation, sAnimation, child) {
              if (fAnimation.isCompleted) {
                return child;
              } else {
                return Opacity(opacity: 0, child: child);
              }
            },
            reverseTransitionDuration: Duration(seconds: 1),
            transitionDuration: Duration(milliseconds: 600));
}
