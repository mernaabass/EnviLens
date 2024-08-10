import 'package:flutter/material.dart';
import 'homepagewidget.dart';

class WelcomescreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: screenWidth,
                height: screenHeight,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/Blurbackground.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.48,
              left: screenWidth * 0.1,
              child: GestureDetector(
                onTap: () {
                  // Navigate to the home page when the button is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomepageWidget()),
                  );
                },
                child: Container(
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.07,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromRGBO(45, 46, 45, 1),
                  ),
                  child: Center(
                    child: Text(
                      'Let’s start',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Manrope',
                        fontSize: screenHeight * 0.02, // Responsive font size
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.85,
              left: 0,
              child: Container(
                width: screenWidth,
                height: screenHeight * 0.03,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/Bottomnavbar.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.464,
              left: screenWidth * 0.08,
              child: Container(
                width: screenWidth * 0.25,
                height: screenHeight * 0.100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/Startbutton.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.32,
              left: screenWidth * 0.199,
              child: Text(
                'Be a product pro, with Envilens, you know!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(46, 65, 43, 1),
                  fontFamily: 'Cabin',
                  fontSize: screenHeight * 0.018, // Responsive font size
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.84,
              left: screenWidth * 0.27,
              child: Text(
                'Empowering sustainable choices, together.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(33, 33, 33, 1),
                  fontFamily: 'Cabin',
                  fontSize: screenHeight * 0.014, // Responsive font size
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.45,
              left: screenWidth * 0.14,
              child: Text(
                'Hello, fellow eco-warrior!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(33, 33, 33, 1),
                  fontFamily: 'Cabin',
                  fontSize: screenHeight * 0.018, // Responsive font size
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.11,
              left: screenWidth * 0.3,
              child: Container(
                width: screenWidth * 0.4,
                height: screenHeight * 0.2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/Darkgreyleavesenvironmentlogoooo1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.58,
              left: screenWidth * 0.21,
              child: GestureDetector(
                onTap: () {
                  // Navigate to the ScanpageWidget when the scan icon is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomepageWidget()),
                  );
                },
                child: Container(
                  width: screenWidth * 0.6,
                  height: screenHeight * 0.28,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/Awar1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
