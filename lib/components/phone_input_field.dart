import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhoneInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  PhoneInputField({required this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Hardcoded Egypt country code (+20)
        Container(
          width: 66.w,
          height: 46.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Center(
            child: Text(
              '+20', // Egypt country code
              style: TextStyle(
                  fontSize: 18.sp, color: Color(0xFF052A43).withOpacity(0.36)),
            ),
          ),
        ),
        SizedBox(width: 12.w),
        // Phone number input with same height as country code
        Expanded(
          child: Container(
            height: 46.h, // Match the height of the country code container
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: hintText,
                labelText: hintText,
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                labelStyle: TextStyle(
                  color: Color(0xFF052A43).withOpacity(0.36),
                  fontSize: 16.0,
                ),
                floatingLabelStyle: TextStyle(
                  fontSize: 23.0,
                  color: Color(0xFF052A43).withOpacity(0.36),
                  backgroundColor: Colors.white,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF052A43).withOpacity(0.36),
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF052A43),
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0),
                hintStyle: TextStyle(
                  color: Colors.transparent,
                ),
                alignLabelWithHint: true,
                isDense: true,
              ),
              style: TextStyle(color: Color(0xFF052A43).withOpacity(0.36)),
            ),
          ),
        ),
      ],
    );
  }
}
