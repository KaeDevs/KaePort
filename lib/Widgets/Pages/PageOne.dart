import 'package:flutter/material.dart';
import 'package:kaeport/Widgets/ContentOptionText.dart';

class PageOne extends StatelessWidget {
  final ScrollController controller;
  const PageOne({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      height: screenHeight,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/bg2.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          double width = constraints.maxWidth;

          if (width < 600) {
            // Mobile
            return _buildMobileLayout(context, screenHeight);
          } else if (width < 1100) {
            // Tablet
            return _buildTabletLayout(context, screenHeight);
          } else {
            // Desktop
            return _buildDesktopLayout(context, screenHeight);
          }
        },
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context, double screenHeight) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/ichigo2.png', height: screenHeight * 0.7),
        const SizedBox(height: 20),
        _buildTextAndOptions(context, fontSize: 40),
      ],
    );
  }

  Widget _buildTabletLayout(BuildContext context, double screenHeight) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/ichigo2.png', height: screenHeight * 0.5),
        const SizedBox(height: 40),
        _buildTextAndOptions(context, fontSize: 80),
      ],
    );
  }

  Widget _buildDesktopLayout(BuildContext context, double screenHeight) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset('assets/ichigo2.png', height: screenHeight),
        _buildTextAndOptions(context, fontSize: 150),
      ],
    );
  }

  Widget _buildTextAndOptions(BuildContext context, {required double fontSize}) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.min,
      children: [
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 20,
          children: [
            GestureDetector(
              onTap: () => _scrollTo(screenHeight),
              child: ContentOption("About"),
            ),
            GestureDetector(
              onTap: () => _scrollTo(screenHeight * 2),
              child: ContentOption("Projects"),
            ),
            GestureDetector(
              onTap: () => _scrollTo(screenHeight * 15),
              child: ContentOption("Contact"),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Stack(
        children: [
          // Implement the stroke
          // Text(
          //   "Kavin M",
          //   style: TextStyle(
          //     fontSize: 70,
          //     letterSpacing: 5,
          //     fontWeight: FontWeight.bold,
          //     foreground: Paint()
          //       ..style = PaintingStyle.stroke
          //       ..strokeWidth = 10
          //       ..color = const Color.fromARGB(255, 255, 255, 255),
          //   ),
          // ),
          // The text inside
          Text(
            "Kavin M",
            style: TextStyle(
              fontFamily: "Neuwelt",
              fontSize:65,
              letterSpacing: 6,
              fontWeight: FontWeight.w900,
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ],
      )
      ],
    );
  }

  void _scrollTo(double offset) {
    controller.animateTo(
      offset,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }
}
