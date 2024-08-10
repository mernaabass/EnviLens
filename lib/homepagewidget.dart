import 'package:flutter/material.dart';
import 'switch_bar.dart'; // Import the SwitchBar widget

class HomepageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
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
                    image: AssetImage('assets/images/Background.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // Use the SwitchBar widget and pass screenWidth and screenHeight
            SwitchBar(screenWidth: screenWidth, screenHeight: screenHeight),
            Positioned(
              top: screenHeight * 0.37,
              left: screenWidth * 0.09,
              child: Column(
                children: [
                  Container(
                    width: screenWidth * 0.85,
                    height: screenHeight * 0.15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromRGBO(255, 255, 255, 0.58),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(7),
                      child: Text(
                        'Get Started with EnviLens! 🌍\nYou’re just a scan away from making \neco-friendly choices. With EnviLens, easily analyze product barcodes to determine their sustainability based on packaging materials and ingredients.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Mako',
                          fontSize: screenHeight * 0.015,
                          fontWeight: FontWeight.normal,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Container(
                    width: screenWidth * 0.85,
                    height: screenHeight * 0.1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromRGBO(255, 255, 255, 0.58),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Text(
                        'Ready to make a difference?\nStart scanning and empower your choices for a healthier planet.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Mako',
                          fontSize: screenHeight * 0.017,
                          fontWeight: FontWeight.normal,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: screenHeight * 0.05,
              left: screenWidth * 0.13,
              child: Image.asset(
                'assets/images/Env.png',
                width: screenWidth * 0.75,
                height: screenHeight * 0.3,
                fit: BoxFit.fitWidth,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
