import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/next_button.dart';
import '../onboarding3/onboarding3.dart'; // Import Onboarding3
import 'second_container_clipper.dart'; // Import the separated clipper

class Onboarding2 extends StatefulWidget {
  const Onboarding2({super.key});

  @override
  _Onboarding2State createState() => _Onboarding2State();
}

class _Onboarding2State extends State<Onboarding2> {
  final PageController _pageController = PageController();
  int _currentPage = 1; // Starting page index

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round(); // Update the current page
      });
    });
  }

  // Updated dot builder for active dot expansion
  Widget buildDot(int index, bool isActive) {
    double width = isActive ? 30.0 : 15.0; // Active dot gets expanded
    double height = 10.0; // Consistent height

    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: isActive ? Color(0xffFDC70A) : Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
    );
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
                // Onboarding content
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Text(
                          "Real-Time Updates\n",
                          style: GoogleFonts.nunito(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff052A43), // Navy blue color
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                        child: Text(
                          "Receive alerts about delays, arrivals, and emergencies to stay updated at all times.\n",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.comfortaa(
                            fontSize: 21,
                            color: Color(0xff052A43), // Navy blue color
                          ),
                        ),
                      ),
                      // Dot Indicator positioned below the text
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(3, (index) {
                          return buildDot(index, index == _currentPage);
                        }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Stack(
              children: [
                ClipPath(
                  clipper: SecoundContainerClipper(),
                  // Use the separated clipper
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
                Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  bottom: 90,
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/onboarding/illustration 2.png',
                      width: 370,
                      height: 360,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: null,
                            child: Text("Skip"),
                            style: TextButton.styleFrom(
                              textStyle: GoogleFonts.comfortaa(
                                  color: Color(0xff85A8BF),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                              foregroundColor: Color(0xff85A8BF),
                              backgroundColor: Colors.transparent,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                          NextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Onboarding3(),
                                ),
                              ); // Navigate to Onboarding3
                            },
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
