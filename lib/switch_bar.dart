import 'package:flutter/material.dart';
import 'scanpagewidget.dart';
import 'homepagewidget.dart';
import 'actionspagewidget.dart';
import 'awarenesspagewidget.dart';

class SwitchBar extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;

  SwitchBar({required this.screenWidth, required this.screenHeight});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: screenHeight * 0.9,
      left: screenWidth * 0.005,
      child: Container(
        width: screenWidth * 0.995,
        height: screenHeight * 0.1,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: screenWidth * 0.995,
                height: screenHeight * 0.1,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/Switch.png'),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.025,
              left: screenWidth * 0.04,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ScanPageWidget()),
                  );
                },
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/Scan_icon.png',
                      width: screenWidth * 0.09,
                      height: screenHeight * 0.04,
                    ),
                    Text(
                      'Scan',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontSize: screenHeight * 0.015,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.025,
              left: screenWidth * 0.25,
              child: GestureDetector(
                onTap: () {
                  // Replace 'Your Scan Result' with the actual scan result if you have one
                  String scanResult = 'Your Scan Result';
                  Navigator.pushNamed(
                    context,
                    '/result',
                    arguments: scanResult,
                  );
                },
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/Result_icon.png',
                      width: screenWidth * 0.06,
                      height: screenHeight * 0.04,
                    ),
                    Text(
                      'Result',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontSize: screenHeight * 0.015,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.025,
              left: screenWidth * 0.45,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomepageWidget()),
                  );
                },
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/Home_icon.png',
                      width: screenWidth * 0.06,
                      height: screenHeight * 0.035,
                    ),
                    Text(
                      'HOME',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontSize: screenHeight * 0.015,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.023,
              left: screenWidth * 0.67,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ActionsPageWidget()),
                  );
                },
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/Actions_icon.png',
                      width: screenWidth * 0.07,
                      height: screenHeight * 0.04,
                    ),
                    Text(
                      'Actions',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontSize: screenHeight * 0.015,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.02,
              left: screenWidth * 0.84,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AwarenessPageWidget()),
                  );
                },
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/Awareness_icon.png',
                      width: screenWidth * 0.1,
                      height: screenHeight * 0.045,
                    ),
                    Text(
                      'Awareness',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontSize: screenHeight * 0.013,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
