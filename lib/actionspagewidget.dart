import 'package:flutter/material.dart';
import 'switch_bar.dart';
import 'chat_page.dart';

class ActionsPageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Actions_page.png'),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Stack(
          children: <Widget>[
            // Add SwitchBar
            SwitchBar(screenWidth: screenWidth, screenHeight: screenHeight),

            // Chat Button
            Positioned(
              top: screenHeight * 0.8, // Adjusted for responsiveness
              left: screenWidth * 0.79,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ChatPage()),
                  );
                },
                child: Container(
                  width: screenWidth * 0.16,
                  height: screenHeight * 0.08,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/Chat_button.png'),
                      fit: BoxFit.fitWidth,
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
