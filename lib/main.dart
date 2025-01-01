import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_project/screens/auth/forgot/forgot_password.dart';
import 'package:shared_project/screens/home.dart';
import 'package:shared_project/screens/auth/sign_in_screen.dart';
import 'package:shared_project/screens/auth/sign_up_screen.dart';
import 'package:shared_project/screens/onboarding/onboarding1/onboarding1.dart';
import 'package:shared_project/screens/onboarding/onboarding2/onboarding2.dart';
import 'package:shared_project/screens/onboarding/onboarding3/onboarding3.dart';
import 'theme/app_theme.dart'; // Import appTheme from theme

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: appTheme, // Use the theme defined in app_theme.dart
          initialRoute: '/',
          routes: {
            '/': (context) => Onboarding1(),
            '/signin': (context) => SignInScreen(),
            '/signup': (context) => SignUpScreen(),
            '/home': (context) => HomePage(),
            '/forgetpassword': (context) => ForgetPasswordScreen(),
            '/onboarding1': (context) => Onboarding1(),
            '/onboarding2': (context) => Onboarding2(),
            '/onboarding3': (context) => Onboarding3(),
          },
        );
      },
    );
  }
}
