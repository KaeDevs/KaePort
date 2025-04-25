import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
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
  // States to track hover effect
  bool isLinkedInHovered = false;
  bool isMailHovered = false;
  bool isCallHovered  = false;
  final Uri linkedinLink = Uri.parse("https://www.linkedin.com/in/kavin-m--/");
  final Uri emailLink = Uri(
          scheme: 'mailto',
          path: 'mkavin2005@gmail.com', // Replace with your email address
          query: 'subject=Hello&body=I want to Develop my App!!?', // Optional
        );
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(
            'assets/chainsaw.png',
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fitHeight,
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  flex: 8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Want To Develop Your App?",
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontFamily: 'PlayFair',
                        ),
                      ),
                      SizedBox(height: 50),
                      Text(
                        "Sounds great, I'll start Cooking(coding).",
                        style: TextStyle(
                          fontSize: 60,
                          color: Colors.white,
                          fontFamily: 'PlayFair',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          "Well, actually, I'll start designing, prototyping, and developing—but you know what I mean. Whether you need an app for your business, a sleek UI/UX for your idea, or the next big thing on the app store, I’m ready to bring your vision to life.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 21,
                            color: Colors.white,
                            fontFamily: 'PlayFair',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // LinkedIn Logo with Confined Glow Effect
                          GestureDetector(
                            onTap: () {
                              _launchInBrowser(linkedinLink);
                            },
                            child: MouseRegion(
                              onEnter: (_) => setState(() => isLinkedInHovered = true),
                              onExit: (_) => setState(() => isLinkedInHovered = false),
                              
                              child: AnimatedContainer(
                                curve: Curves.easeInOut,
                                duration: Duration(milliseconds: 300),
                                transform: isLinkedInHovered ? (Matrix4.identity()..scale(1.1)) : Matrix4.identity(),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle, // Ensures circular glow
                                  
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50), // Ensures the glow stays confined
                                  child: Image.asset(
                                    'assets/linkedin.png',
                                    fit: BoxFit.contain,
                                    height: MediaQuery.of(context).size.height / 10,
                                    width: MediaQuery.of(context).size.width / 10,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          // Mail Logo with Confined Glow Effect
                          GestureDetector(
                            onTap: () {
                              _launchInBrowser(emailLink);
                            },
                            child: MouseRegion(
                              onEnter: (_) => setState(() => isMailHovered = true),
                              onExit: (_) => setState(() => isMailHovered = false),
                              child: AnimatedContainer(
                                curve: Curves.easeInOut,
                                duration: Duration(milliseconds: 300),
                                transform: isMailHovered ? (Matrix4.identity()..scale(1.1)) : Matrix4.identity(),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle, // Ensures circular glow
                                  
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50), // Ensures the glow stays confined
                                  child: Image.asset(
                                    'assets/mail.png',
                                    fit: BoxFit.contain,
                                    height: MediaQuery.of(context).size.height / 10,
                                    width: MediaQuery.of(context).size.width / 10,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          // Mail Logo with Confined Glow Effect
                          GestureDetector(
                            onTap: () => showDialog<String>(context: context,builder: (context) => Dialog(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text("Call : +91 9384242333", style: TextStyle(fontFamily: 'Neuwelt', fontSize: 30),),
                                    
                                  ],
                                ),
                              ),

                            ),),
                            child: MouseRegion(
                              onEnter: (_) => setState(() => isCallHovered = true),
                              onExit: (_) => setState(() => isCallHovered = false),
                              child: AnimatedContainer(
                                curve: Curves.easeInOut,
                                duration: Duration(milliseconds: 300),
                                transform: isCallHovered ? (Matrix4.identity()..scale(1.1)) : Matrix4.identity(),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle, // Ensures circular glow
                                  
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50), // Ensures the glow stays confined
                                  child: Image.asset(
                                    'assets/call.png',
                                    fit: BoxFit.contain,
                                    height: MediaQuery.of(context).size.height / 10,
                                    width: MediaQuery.of(context).size.width / 10,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
