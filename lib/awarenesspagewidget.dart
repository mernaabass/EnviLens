import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'switch_bar.dart';
import 'chat_page.dart';

class AwarenessPageWidget extends StatelessWidget {
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
            image: AssetImage('assets/images/Awareness_background.png'),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Stack(
          children: <Widget>[
            // Add SwitchBar
            SwitchBar(screenWidth: screenWidth, screenHeight: screenHeight),

            // Positioned Widgets
            Positioned(
              top: screenHeight * 0.07,
              left: screenWidth * 0.062,
              child: Container(
                width: screenWidth * 0.89,
                height: screenHeight * 0.07,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromRGBO(255, 255, 255, 0.58),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Discover insights into how everyday products affect our planet and learn how you can make a difference',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Mako',
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      height: 1.37,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.15,
              left: screenWidth * 0.07,
              child: GestureDetector(
                onTap: () async {
                  await launchUrl(Uri.parse(
                      'https://education.nationalgeographic.org/resource/worlds-plastic-pollution-crisis-explained/'));
                },
                child: Container(
                  width: screenWidth * 0.87,
                  height: screenHeight * 0.09,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/Crisis.png'),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.37,
              left: screenWidth * 0.36,
              child: GestureDetector(
                onTap: () async {
                  await launchUrl(Uri.parse(
                      'https://www.greenpeace.org/usa/why-greenpeace-is-calling-on-governments-to-cut-plastic-production-by-at-least-75-by-2040/'));
                },
                child: Container(
                  width: screenWidth * 0.32,
                  height: screenHeight * 0.09,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/Cut_plastic.png'),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.37,
              left: screenWidth * 0.05,
              child: GestureDetector(
                onTap: () async {
                  await launchUrl(Uri.parse(
                      'https://www.greenpeace.org/usa/key-facts-on-plastic-and-climate/'));
                },
                child: Container(
                  width: screenWidth * 0.28,
                  height: screenHeight * 0.09,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/Key_facts.png'),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.25,
              left: screenWidth * 0.07,
              child: GestureDetector(
                onTap: () async {
                  await launchUrl(Uri.parse(
                      'https://www.greenpeace.org/usa/plastic-is-a-climate-health-and-social-justice-issue/'));
                },
                child: Container(
                  width: screenWidth * 0.87,
                  height: screenHeight * 0.11,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/Justice.png'),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.74,
              left: screenWidth * 0.07,
              child: GestureDetector(
                onTap: () async {
                  await launchUrl(Uri.parse(
                      'https://www.sciencedirect.com/science/article/abs/pii/S0959652623032407'));
                },
                child: Container(
                  width: screenWidth * 0.55,
                  height: screenHeight * 0.10,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/Microbeads.png'),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.65,
              left: screenWidth * 0.63,
              child: GestureDetector(
                onTap: () async {
                  await launchUrl(Uri.parse(
                      'https://www.oneplanetnetwork.org/SDG-12/natural-resource-use-environmental-impacts'));
                },
                child: Container(
                  width: screenWidth * 0.30,
                  height: screenHeight * 0.15,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/Natural_resources.png'),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.48,
              left: screenWidth * 0.63,
              child: GestureDetector(
                onTap: () async {
                  await launchUrl(Uri.parse(
                      'https://www.hercircle.in/engage/fashion/trends/everyday-unsustainable-products-that-you-use-unconsciously-but-shouldnrsquot-682.html'));
                },
                child: Container(
                  width: screenWidth * 0.30,
                  height: screenHeight * 0.18,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/Unsustainable_products.png'),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.37,
              left: screenWidth * 0.72,
              child: GestureDetector(
                onTap: () async {
                  await launchUrl(Uri.parse(
                      'https://www.breakfreefromplastic.org/the-story-of-sachets/'));
                },
                child: Container(
                  width: screenWidth * 0.24,
                  height: screenHeight * 0.09,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/Sachets.png'),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.61,
              left: screenWidth * 0.07,
              child: GestureDetector(
                onTap: () async {
                  await launchUrl(Uri.parse(
                      'https://sustainable-earth.org/cosmetic-ingredients/#:~:text=The%20chemicals%20in%20nail%20polish,and%20groundwater%20around%20the%20landfill.'));
                },
                child: Container(
                  width: screenWidth * 0.37,
                  height: screenHeight * 0.12,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/Cosmetic.png'),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.48,
              left: screenWidth * 0.05,
              child: GestureDetector(
                onTap: () async {
                  await launchUrl(Uri.parse(
                      'https://www.onyalife.com/a/blog/post/eco-friendly-products'));
                },
                child: Container(
                  width: screenWidth * 0.56,
                  height: screenHeight * 0.12,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/Friendly_products.png'),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.81,
              left: screenWidth * 0.79,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ChatPage()), // Navigate to ChatPage
                  );
                },
                child: Container(
                  width: screenWidth * 0.15,
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
