import 'package:flutter/material.dart';

class ContentOption extends StatelessWidget {
  final String title;
  const ContentOption(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: "Go To $title Section",
      child: Stack(
        children: [
          // Implement the stroke
          // Text(
          //   title,
          //   style: TextStyle(
          //     fontSize: 30,
          //     letterSpacing: 5,
          //     fontWeight: FontWeight.bold,
          //     foreground: Paint()
          //       ..style = PaintingStyle.stroke
          //       ..strokeWidth = 7
          //       ..color = const Color.fromARGB(255, 65, 5, 5),
          //   ),
          // ),
          // The text inside
          Text(
            title,
            style: TextStyle(
              fontSize:25,
              letterSpacing: 5,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ],
      )
    );
  }
}
