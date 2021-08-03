import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Lottie.asset('assets/cart.json',
              controller: _controller,
              height: 400,
              frameRate: FrameRate(30), onLoaded: (composition) {
        _controller.duration = composition.duration;
        _controller..forward();

        _controller.repeat();
      })),
    );
  }
}
