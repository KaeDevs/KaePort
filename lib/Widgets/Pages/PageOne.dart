import 'package:flutter/material.dart';
import 'package:kaeport/Widgets/ContentOptionText.dart';

class PageOne extends StatelessWidget {
  final ScrollController controller;
  const PageOne({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/bg2.jpg'), fit: BoxFit.cover)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            'assets/ichigo2.png',
            height: MediaQuery.of(context).size.height,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 Row(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    // mainAxisSize: MainAxisSize.max,
                    children: [
                      GestureDetector(
                          onTap: () {
                            controller.animateTo(
                                MediaQuery.of(context).size.height,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          },
                          child: ContentOption("About")),
                          // Spacer(),
                      SizedBox(
                        width: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.animateTo(
                              MediaQuery.of(context).size.height +
                                  MediaQuery.of(context).size.height,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: ContentOption("Projects"),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      GestureDetector(
                          onTap: () {
                            controller.animateTo(
                                MediaQuery.of(context).size.height +
                                    MediaQuery.of(context).size.height +
                                    MediaQuery.of(context).size.height +
                                    MediaQuery.of(context).size.height +
                                    MediaQuery.of(context).size.height +
                                    MediaQuery.of(context).size.height,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          },
                          child: ContentOption("Contact")),
                      
                    ],
                  ),
                
                Text(
                  "Kavin M",
                  style: TextStyle(
                      fontSize: 150,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      // fontWeight: FontWeight.w400,
                      fontFamily: 'Neuwelt'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
