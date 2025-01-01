import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil
import '../components/dot_indicator.dart';
import '../components/next_button.dart';
import '../onboarding2/onboarding2.dart';
import 'first_container_clipper.dart';

class Onboarding1 extends StatefulWidget {
  const Onboarding1({super.key});

  @override
  _Onboarding1State createState() => _Onboarding1State();
}

class _Onboarding1State extends State<Onboarding1> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage =
            _pageController.page!.round(); // This updates the page index
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Stack(
              children: [
                ClipPath(
                  clipper: FirstContainerClipper(),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xff052A43), // Gradient start color
                          Color(0xff0D6AA9), // Gradient end color
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/onboarding/illustration 1.png',
                      width: 330.w, // Use ScreenUtil for width
                      height: 288.h, // Use ScreenUtil for height
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(20.w), // Use ScreenUtil for padding
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r), // Use ScreenUtil for radius
                  topRight: Radius.circular(20.r),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DotIndicator(
                    currentPage: _currentPage,
                    totalPages: 3,
                  ),
                  SizedBox(height: 40.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      "Track your bus",
                      style: GoogleFonts.nunito(
                        fontSize: 32.sp, // Use ScreenUtil for font size
                        fontWeight: FontWeight.bold,
                        color: Color(0xff052A43),
                      ),
                    ),
                  ),
                  SizedBox(height: 25.h), // Add SizedBox for spacing
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Text(
                      "Easily locate your child's bus in real-time and ensure their safety on every journey.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.comfortaa(
                        fontSize: 18.sp, // Use ScreenUtil for font size
                        color: Color(0xff052A43),
                      ),
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: null,
                        child: Text("Skip"),
                        style: TextButton.styleFrom(
                          textStyle: GoogleFonts.comfortaa(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.normal,
                          ),
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.transparent,
                          padding: EdgeInsets.symmetric(
                              horizontal: 50.w, vertical: 20.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                        ),
                      ),
                      NextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Onboarding2()),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
