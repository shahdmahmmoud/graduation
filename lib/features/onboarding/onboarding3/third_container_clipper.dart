// third_container_clipper.dart

import 'package:flutter/material.dart';

class ThirdContainerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    // First curve
    path.lineTo(0, size.height * 0.75);
    var firstStart = Offset(size.width / 2, size.height * 1.2);
    var firstEnd = Offset(size.width, size.height * 0.75);
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
