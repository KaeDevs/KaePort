import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kaeport/Colors/appColor.dart';
import 'dart:math';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final bool isMobile = screenWidth < 1200;
    // final bool isTablet = screenWidth >= 600 && screenWidth < 1024;

    double scale(double base) {
      final area = screenWidth * screenHeight;
      final factor = sqrt(area);

      if (isMobile) {
        return factor * base / 350;}
      // } else if (isTablet) {
      //   return factor * base / 450;
      // } 
      else {
        return factor * base / 500;
      }
    }

    return SizedBox(
      width: screenWidth,
      height: screenHeight,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Stack(
          children: [
            // Background layers
            Column(
              children: [
                Container(
                  height: screenHeight * 0.20,
                  color: Colors.white,
                ),
                Expanded(
                  child: Stack(children: [
                    Container(color: gray),
                    Center(
                      child: Container(
                        alignment: Alignment.bottomRight,
                        // margin: const EdgeInsets.only(top: -50, bottom: 20),
                        child: Image.asset(
                            alignment: Alignment.bottomRight,
                            // 'assets/spidey.png',
                            'assets/pic2.png',
                            height: screenHeight * 1,
                            fit: BoxFit.contain),
                      ),
                    ),
                  ]),
                ),
              ],
            ),

            // Foreground content
            // Foreground content
Align(
  alignment: Alignment.topLeft,
  child: Column(
    children: [
      // White Section with Title
      Container(
        height: screenHeight * 0.20,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        alignment: Alignment.bottomLeft,
        child: Text(
          "About Kavin",
          style: TextStyle(
            fontSize: scale(22),
            color: Colors.black,
            fontFamily: 'BernardMt',
          ),
        ),
      ),
  
      // Remaining content with flexible height
      Expanded(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                    maxWidth: constraints.maxWidth
                  ),
                  child: isMobile
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              color: Colors.black.withOpacity(0.2),
                              child: _buildInfoColumn(scale, isMobile),
                            ),
                          ),
                        )
                      : Padding(
                        padding: EdgeInsets.fromLTRB(isMobile ? 10 : 50, 0,0,0,),
                        child: Align(alignment: Alignment.topLeft,child: _buildInfoColumn(scale, isMobile)),
                      ),
                ),
              );
            },
          ),
        ),
      ),
    ],
  ),
),

          ],
        ),
      ),
    );
  }

  Widget _buildInfoColumn(double Function(double) scale, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        Text(
          "Passionate App Developer with a strong foundation\nin Java, Dart and Kotlin, actively developing\nuser-centric mobile applications",
          style: TextStyle(
            fontSize: scale(12),
            color: red,
            decoration: TextDecoration.underline,
            fontFamily: 'Neuwelt',
          ),
        ),
        const SizedBox(height: 30),
        _buildSections(scale(16), scale(12), isMobile),
        const SizedBox(height: 50),
      ],
    );
  }

  Widget _buildSections(double titleSize, double bodySize, bool isMobile) {
    final section2 = _buildSection(
      title: "Education",
      content:
          "Anna University,\nBachelor Of Engineering,\nComputer Science and\nEngineering, 2023 - 2027",
      titleSize: titleSize,
      bodySize: bodySize,
    );

    final section1 = _buildSection(
      title: "Areas of Interest:",
      content: "App Development,\nSoftware Development,\nUI/UX",
      titleSize: titleSize,
      bodySize: bodySize,
    );

    return isMobile
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              section1,
              const SizedBox(height: 30),
              section2,
            ],
          )
        : Wrap(
            spacing: 50,
            runSpacing: 30,
            children: [section1, section2],
          );
  }

  Widget _buildSection({
    required String title,
    required String content,
    required double titleSize,
    required double bodySize,
  }) {
    return SizedBox(
      width: 350,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: titleSize,
              color: red,
              // decoration: TextDecoration.underline,
              fontFamily: 'Neuwelt',
            ),
          ),
          const SizedBox(height: 10),
          Text(
            content,
            style: TextStyle(
              fontSize: bodySize,
              color: Colors.white,
              fontFamily: 'Neuwelt',
            ),
          ),
        ],
      ),
    );
  }
}
