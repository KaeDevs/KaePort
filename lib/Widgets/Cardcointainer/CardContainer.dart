import 'package:flutter/material.dart';
import 'package:kaeport/Colors/appColor.dart';
import 'package:url_launcher/url_launcher.dart';
class CardContainer extends StatefulWidget {
  final int num;
  const CardContainer(this.num, {super.key});

  @override
  _CardContainerState createState() => _CardContainerState();
}
final Uri _url = Uri.parse('https://play.google.com/store/apps/details?id=mhc.file.mhcdb&hl=en_IN');
class _CardContainerState extends State<CardContainer> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        transform:
            _isHovered ? (Matrix4.identity()..scale(1.05)) : Matrix4.identity(),
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                      color: const Color.fromARGB(255, 24, 24, 24), blurRadius: 30, spreadRadius: 1)
                ]
              : [BoxShadow(color: Colors.black, blurRadius: 20)],
          color: gray,
        ),
        height: 600,
        width: 400,
        child: Column(
          children: [
            SizedBox(height: 50),
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: gray,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/MHC.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "MHC Display\nBoard",
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                fontSize: 35,
                color: const Color.fromARGB(255, 237, 221, 212),
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Cooked using Java!",
              style: TextStyle(
                fontSize: 16,
                color: const Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.w600,
              ),
            ),
            IconButton(
              onPressed: () {
                _launchUrl();
              },
              icon: Icon(Icons.arrow_circle_right_outlined),
              iconSize: 50,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _launchUrl() async{
  if(!await launchUrl(_url)){
    throw Exception("Could not launch $_url");
  }
}