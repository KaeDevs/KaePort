import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PageFour extends StatefulWidget {
  const PageFour({super.key});

  @override
  State<PageFour> createState() => _PageFourState();
}

Future<void> _launchInBrowser(Uri url) async {
  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    throw Exception('Could not launch $url');
  }
}

class _PageFourState extends State<PageFour> {
  bool isLinkedInHovered = false;
  bool isMailHovered = false;
  bool isCallHovered = false;

  final Uri linkedinLink = Uri.parse("https://www.linkedin.com/in/kavin-m--/");
  final Uri emailLink = Uri(
    scheme: 'mailto',
    path: 'mkavin2005@gmail.com',
    query: 'subject=Hello&body=I want to Develop my App!!?',
  );

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = screenWidth < 1000;

    double scale(double size) =>
        isMobile ? size * screenHeight / 800 : size;

    return Container(
      width: screenWidth,
      height: screenHeight,
      color: Colors.black,
      child: isMobile
          ? Stack(
              children: [
                // Background Image for Mobile
                Positioned.fill(
                  child: Image.asset(
                    'assets/chainsaw.png',
                    fit: BoxFit.cover,
                    colorBlendMode: BlendMode.darken,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
                // Foreground Content with Glass Blur
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          width: screenWidth * 0.9,
                          padding: EdgeInsets.all(15),
                          color: Colors.white.withOpacity(0.05),
                          child: _buildContent(scale, isMobile, screenWidth, screenHeight),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          : Row(
              children: [
                Image.asset(
                  'assets/chainsaw.png',
                  height: screenHeight,
                  fit: BoxFit.fitHeight,
                ),
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: _buildContent(scale, isMobile, screenWidth, screenHeight),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildContent(Function scale, bool isMobile, double screenWidth, double screenHeight) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Want To Develop Your App?",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: scale(30),
            color: Colors.white,
            fontFamily: 'PlayFair',
          ),
        ),
        SizedBox(height: scale(30)),
        Text(
          "Sounds great, I'll start Cooking(coding).",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: scale(45),
            color: Colors.white,
            fontFamily: 'PlayFair',
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: scale(30)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            "Well, actually, I'll start designing, prototyping, and developing—but you know what I mean. Whether you need an app for your business, a sleek UI/UX for your idea, or the next big thing on the app store, I’m ready to bring your vision to life.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: scale(18),
              color: Colors.white,
              fontFamily: 'PlayFair',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(height: scale(30)),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 20,
          runSpacing: 20,
          children: [
            _buildIconButton('assets/linkedin.png', isLinkedInHovered,
                () => _launchInBrowser(linkedinLink),
                (v) => setState(() => isLinkedInHovered = v),
                screenWidth,
                screenHeight),
            _buildIconButton('assets/mail.png', isMailHovered,
                () => _launchInBrowser(emailLink),
                (v) => setState(() => isMailHovered = v),
                screenWidth,
                screenHeight),
            _buildIconButton(
                'assets/call.png',
                isCallHovered,
                () => showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            "Call : +91 9384242333",
                            style: TextStyle(
                                fontFamily: 'Neuwelt', fontSize: 30),
                          ),
                        ),
                      ),
                    ),
                (v) => setState(() => isCallHovered = v),
                screenWidth,
                screenHeight),
          ],
        ),
      ],
    );
  }

  Widget _buildIconButton(
    String assetPath,
    bool isHovered,
    VoidCallback onTap,
    ValueChanged<bool> onHover,
    double screenWidth,
    double screenHeight,
  ) {
    final isMobile = screenWidth < 700;
    final iconSize = isMobile ? screenHeight / 14 : screenHeight / 10;

    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        onEnter: (_) => onHover(true),
        onExit: (_) => onHover(false),
        child: AnimatedContainer(
          curve: Curves.easeInOut,
          duration: Duration(milliseconds: 300),
          transform:
              isHovered ? (Matrix4.identity()..scale(1.1)) : Matrix4.identity(),
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              assetPath,
              fit: BoxFit.contain,
              height: iconSize,
              width: iconSize,
            ),
          ),
        ),
      ),
    );
  }
}
