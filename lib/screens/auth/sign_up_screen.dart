import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_project/theme/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../components/custom_button.dart';
import '../../components/custom_rich_text_button.dart';
import '../../components/custom_text_field.dart';
import '../../components/custom_divider_with_text.dart'; // Import the custom divider
import 'sign_in_screen.dart'; // Ensure the correct import path

class SignUpScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(23.0.sp),
              // Use ScreenUtil to adjust padding
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 143.h),
                  // Add some space at the top
                  Text(
                    'Create New Account',
                    style: TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 32.0.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 32.0.h),
                  // Use ScreenUtil for height spacing
                  CustomTextField(
                    hintText: 'Email Address',
                    obscureText: false,
                    controller: emailController,
                  ),
                  CustomTextField(
                    hintText: 'Password',
                    obscureText: true,
                    controller: passwordController,
                  ),
                  CustomTextField(
                    hintText: 'Confirm Password',
                    obscureText: true,
                    controller: confirmPasswordController,
                  ),
                  SizedBox(height: 30.0.h),
                  // Add spacing before the button
                  CustomButton(
                    text: 'Sign Up',
                    onPressed: () {
                      // Handle sign up
                    },
                  ),
                  SizedBox(height: 38.0.h),
                  // Add spacing before the divider
                  CustomDividerWithText(
                    text: 'or Sign up with',
                  ),
                  SizedBox(height: 38.0.h),
                  // Use ScreenUtil for height spacing
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          // Handle Google sign in
                        },
                        icon: SvgPicture.asset(
                          'assets/icons/Button with centered icon.svg',
                          // Use the SVG asset
                          width: 45.w,
                          height: 45.h,
                        ),
                        iconSize: 45.w, // Adjust the size of the IconButton
                      ),
                      SizedBox(width: 9.0.w),
                      // Add some space between the icons
                      GestureDetector(
                        onTap: () {
                          // Handle Facebook sign in
                        },
                        child: Container(
                          width: 45.w,
                          height: 45.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            // Set the background color to white
                            shape: BoxShape.circle, // Make it circular
                          ),
                          child: Center(
                            child: FaIcon(
                              FontAwesomeIcons.facebookF,
                              // Use the FontAwesome icon
                              color: Color(0xFF1877F2), // Set the color to blue
                              size: 25
                                  .w, // Adjust the size of the icon inside the container
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 38.0.h),
                  // Add spacing before the signin link
                  CustomRichTextButton(
                    regularText: "Already have an account? ",
                    buttonText: 'Sign in',
                    navigateToScreen:
                        SignInScreen(), // Pass the widget directly here
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
