import 'package:flutter/material.dart';
import 'package:kaeport/Colors/appColor.dart';
import 'package:kaeport/Widgets/ContentOptionText.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: double.maxFinite,
      child: Column(
        children: [
          Container(
            width: double
                .maxFinite, // Ensures background color spans the full width
            color: const Color.fromARGB(255, 255, 255, 255),
            padding: const EdgeInsets.fromLTRB(100, 150, 0, 10),
            child: Center(
              // Use Center to limit child to a max width
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1500),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "About Kavin",
                      style: TextStyle(
                        fontSize: 120,
                        color: Colors.black,
                        fontFamily: 'BernardMt',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double
                  .maxFinite, // Ensures background color spans the full width
              padding: const EdgeInsets.fromLTRB(100, 50, 0, 10),
              alignment: Alignment.topLeft,
              color: gray,
              child: Center(
                // Use Center to limit child to a max width
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1500),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              " Passionate App Developer with a strong foundation\n in Java, Dart and Kotlin, actively developing\n user-centric mobile applications",
                              style: TextStyle(
                                  fontSize: 40,
                                  color: red,
                                  decoration: TextDecoration.underline,
                                  fontFamily: 'Neuwelt'),
                              maxLines: 4,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Ensures alignment at the top
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Education",
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: red,
                                    decoration: TextDecoration.underline,
                                    fontFamily: 'Neuwelt',
                                  ),
                                ),
                                Text(
                                  "Anna University,\nBachelor Of Engineering,\nComputer Science and,\nEngineering, 2023 - 2027",
                                  style: TextStyle(
                                    fontSize: 21,
                                    color: Colors.white,
                                    fontFamily: 'Neuwelt',
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 50),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Areas of Interest:",
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: red,
                                    decoration: TextDecoration.underline,
                                    fontFamily: 'Neuwelt',
                                  ),
                                ),
                                Text(
                                  "App Development,\nSoftware Development,\nUI/UX",
                                  style: TextStyle(
                                    fontSize: 21,
                                    color: Colors.white,
                                    fontFamily: 'Neuwelt',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
