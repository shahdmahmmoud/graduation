import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomToggle extends StatelessWidget {
  final bool isEmailSelected;
  final VoidCallback onToggle;

  const CustomToggle({
    Key? key,
    required this.isEmailSelected,
    required this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggle,
      child: Container(
        width: double.infinity,
        height: 46.h, // Same height as the text field
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Stack(
          children: [
            AnimatedAlign(
              alignment: isEmailSelected
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              duration: Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              child: Container(
                width: 0.5.sw, // Make it half the width of the container
                height: 56.h,
                decoration: BoxDecoration(
                  color: isEmailSelected
                      ? Color(0xff052A43)
                      : Color(0xff052A43), // Keep it navy for both
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Text(
                        'Email',
                        style: TextStyle(
                          color: isEmailSelected
                              ? Colors.white
                              : Color(0xff052A43),
                          fontSize: 16.sp,
                          fontFamily: 'Comfortaa',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Text(
                        'Phone',
                        style: TextStyle(
                          color: isEmailSelected
                              ? Color(0xff052A43)
                              : Colors.white,
                          fontSize: 16.sp,
                          fontFamily: 'Comfortaa',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
