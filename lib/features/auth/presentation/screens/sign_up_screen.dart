import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../components/custom_button.dart';
import '../../../../components/custom_rich_text_button.dart';
import '../../../../components/custom_text_field.dart';
import '../../../../components/custom_divider_with_text.dart';
import '../../../../core/theme/app_theme.dart';
import 'sign_in_screen.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(23.0.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 16.h),
                  Text(
                    'Create New Account',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  SizedBox(height: 12.0.h),
                  Center(
                    child: Text(
                      'Provide your information to set up your account.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  SizedBox(height: 32.0.h),
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
                  SizedBox(height: 40.0.h), // Match spacing with SignInScreen
                  CustomButton(
                    text: 'Sign Up',
                    onPressed: () {
                      // Handle sign up
                    },
                  ),
                  SizedBox(height: 28.0.h), // Match spacing with SignInScreen
                  CustomDividerWithText(
                    text: 'or Sign up with',
                  ),
                  SizedBox(height: 32.0.h), // Match spacing with SignInScreen
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          // Handle Google sign in
                        },
                        icon: SvgPicture.asset(
                          'assets/icons/Button with centered icon.svg',
                          width: 45.w,
                          height: 45.h,
                        ),
                        iconSize: 45.w,
                      ),
                      SizedBox(width: 9.0.w), // Match spacing with SignInScreen
                      GestureDetector(
                        onTap: () {
                          // Handle Facebook sign in
                        },
                        child: Container(
                          width: 45.w,
                          height: 45.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: FaIcon(
                              FontAwesomeIcons.facebookF,
                              color: Color(0xFF1877F2),
                              size: 25.w,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 32.0.h), // Match spacing with SignInScreen
                  CustomRichTextButton(
                    regularText: "Already have an account? ",
                    buttonText: 'Sign In',
                    navigateToScreen: SignInScreen(),
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