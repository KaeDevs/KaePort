import 'package:flutter/material.dart';

class ContentOption extends StatelessWidget {
  final String title;
  const ContentOption(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: "Go To $title Section",
      child: Text(
        title,
        style: TextStyle(
            fontSize: 35, color: const Color.fromARGB(255, 255, 97, 11), fontWeight: FontWeight.w600, ),
            textAlign: TextAlign.right,
            
      ),
    );
  }
}
