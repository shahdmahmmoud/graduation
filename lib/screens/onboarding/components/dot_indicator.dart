import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  final int currentPage;
  final int totalPages;

  const DotIndicator({
    required this.currentPage,
    required this.totalPages,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          totalPages,
          (index) => buildDot(index),
        ),
      ),
    );
  }

  Widget buildDot(int index) {
    double width = currentPage == index ? 29.0 : 12.0; // Wider when active
    double height = currentPage == index
        ? 10.0
        : 12.0; // Height for active and inactive dots

    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      // Smooth transition duration
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: width,
      // Apply width change for expansion
      height: height,
      // Apply height change for expansion
      decoration: BoxDecoration(
        color: currentPage == index ? Color(0xffFDC70A) : Colors.grey[300],
        borderRadius: BorderRadius.circular(
            currentPage == index ? 17 : 5), // Adjust border radius
      ),
    );
  }
}
