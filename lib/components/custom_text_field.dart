import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType keyboardType;

  CustomTextField({
    required this.hintText,
    required this.obscureText,
    required this.controller,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> _isObscured = ValueNotifier<bool>(obscureText);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ValueListenableBuilder<bool>(
        valueListenable: _isObscured,
        builder: (context, isObscured, child) {
          return TextField(
            controller: controller,
            obscureText: isObscured,
            keyboardType: keyboardType,
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
                  EdgeInsets.symmetric(horizontal: 14.0, vertical: 16.0),
              hintStyle: TextStyle(
                color: Colors
                    .transparent, // Make hint text transparent when focused
              ),
              alignLabelWithHint: true,
              isDense: true,
              suffixIcon: obscureText
                  ? IconButton(
                      icon: Icon(
                        isObscured ? Icons.visibility_off : Icons.visibility,
                        color: Color(0xFF052A43).withOpacity(0.70),
                        size: 24.0,
                        weight: 1.0.w, // Adjust the size of the eye icon
                      ),
                      onPressed: () {
                        _isObscured.value = !isObscured;
                      },
                    )
                  : null,
            ),
            style: TextStyle(color: Color(0xFF052A43).withOpacity(0.36)),
          );
        },
      ),
    );
  }
}
