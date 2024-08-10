import 'package:flutter/material.dart';
import 'switch_bar.dart';

class ResultPageWidget extends StatelessWidget {
  final String result; // Add a field to hold the result

  ResultPageWidget(
      {required this.result}); // Update the constructor to accept the result

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Background_result.png'),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Stack(
          children: <Widget>[
            // Add SwitchBar
            SwitchBar(screenWidth: screenWidth, screenHeight: screenHeight),

            // Result Container
            Positioned(
              top: screenHeight * 0.4, // Adjusted for responsiveness
              left: screenWidth * 0.06,
              right: screenWidth * 0.06,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromRGBO(255, 255, 255, 0.58),
                    ),
                    constraints: BoxConstraints(
                      maxHeight:
                          screenHeight * 0.5, // Maximum height of the container
                    ),
                    child: SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: 100, // Minimum height if the text is small
                        ),
                        child: Text(
                          result,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Mako',
                            fontSize: screenHeight * 0.02,
                            fontWeight: FontWeight.normal,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Title
            Positioned(
              top: screenHeight * 0.36,
              left: screenWidth * 0.08,
              child: Text(
                'Result',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontFamily: 'Mako',
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  height: 1.5,
                ),
              ),
            ),

            // Image
            Positioned(
              top: screenHeight * 0.05,
              left: screenWidth * 0.12,
              child: Container(
                width: screenWidth * 0.75,
                height: screenHeight * 0.3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/Env.png'),
                    fit: BoxFit.fitWidth,
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
