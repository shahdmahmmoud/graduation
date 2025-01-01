import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import the flutter_svg package
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Import the font_awesome_flutter package
import '../../components/custom_button.dart';
import '../../components/custom_rich_text_button.dart';
import '../../components/custom_text_field.dart';
import '../../components/custom_divider_with_text.dart'; // Import the custom divider
import 'forgot/forgot_password.dart';
import 'sign_up_screen.dart';
import 'package:shared_project/theme/app_theme.dart';

class SignInScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                  SizedBox(height: 100.9.h),
                  // Add some space at the top
                  Text(
                    'Welcome Back',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  SizedBox(height: 8.0.h),
                  // Use ScreenUtil for height spacing
                  Text(
                    'Hey! Good to see you again',
                    style: TextStyle(
                      fontFamily: 'Comfortaa',
                      color: Colors.white,
                      fontSize: 16.sp,
                    ), // Font size adjusted with ScreenUtil
                  ),
                  SizedBox(height: 38.0.h),
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
                  SizedBox(height: 30.0.h),
                  // Add spacing before the button
                  CustomButton(
                    text: 'Sign In',
                    onPressed: () {
                      // Handle sign in
                    },
                  ),
                  SizedBox(height: 38.0.h),
                  // Add spacing between the button and forgot password
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgetPasswordScreen()));
                    },
                    child: Text(
                      'Forgot your password?',
                      style: TextStyle(
                        fontFamily: 'Comfortaa',
                        color: Colors.white,
                        fontSize: 16.sp,
                      ), // Adjust font size with ScreenUtil
                    ),
                  ),
                  SizedBox(height: 20.0.h),
                  // Add spacing before the divider
                  CustomDividerWithText(
                    text: 'or Sign in with',
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
                  // Add spacing before the signup link
                  CustomRichTextButton(
                    regularText: "Don't have an account? ",
                    buttonText: 'Sign up',
                    navigateToScreen:
                        SignUpScreen(), // Pass the widget directly here
                  ),
                  SizedBox(height: 93.5.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
