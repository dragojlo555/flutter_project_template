import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Stack(
        children: [
          //Background image
          // Positioned(
          //   top: 0,
          //   child: Image.asset(
          //     "assets/images/white_wallpaper.png",
          //     height: size.height,
          //     width: size.width,
          //   ),
          // ),
          child,
        ],
      ),
    );
  }
}
