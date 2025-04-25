import 'package:flutter/material.dart';
import 'package:kaeport/Colors/appColor.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Cardcointainer/CardContainer.dart';

class PageProjOne extends StatelessWidget {
  const PageProjOne({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // List of your mobile screenshots
    final List<String> mobileScreenshots = [
      'assets/mhc1.jpg',
      'assets/mhc2.jpg',
      'assets/mhc3.jpg',
      'assets/mi/mhc7.jpg',
      'assets/mi/mhc8.jpg',
      'assets/mi/mhc9.jpg',
      'assets/mi/mhc10.jpg',
      'assets/mi/mhc11.jpg',
      'assets/mi/mhc4.jpg',
      'assets/mi/mhc5.jpg',
      'assets/mi/mhc6.jpg',
      
      // Add more paths here
    ];

    return Container(
      // height: screenHeight,
      width: screenWidth,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [red, Colors.black],
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0,
              child: Image.asset(
                'assets/ichigo.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(80),
            child: Center(
              child: ConstrainedBox(
                
                constraints: BoxConstraints(maxWidth: 1200),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Projects",
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: Colors.black87,
                            blurRadius: 4,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40),
                    Wrap(
                      spacing: 40,
                      runSpacing: 40,
                      alignment: WrapAlignment.center,
                      children: [
                        CardContainer(1),
                        // Map through all screenshots
                        ...mobileScreenshots.map(
                          (path) => MobileScreenshotCard(imagePath: path),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MobileScreenshotCard extends StatelessWidget {
  final String imagePath;

  const MobileScreenshotCard({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 600,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.black,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 12,
            offset: Offset(0, 6),
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.asset(imagePath, fit: BoxFit.cover),
      ),
    );
  }
}
