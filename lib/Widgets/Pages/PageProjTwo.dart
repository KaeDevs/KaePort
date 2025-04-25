import 'package:flutter/material.dart';
import 'package:kaeport/Colors/appColor.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Cardcointainer/CardContainer.dart';

class PageProjTwo extends StatelessWidget {
  const PageProjTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: gray,
      child: Stack(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                color: gray,
                height: MediaQuery.of(context).size.height / 2,
              ),
              Container(
                color: red,
                height: MediaQuery.of(context).size.height / 2,
              )
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset('assets/ichigo.png', height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,fit: BoxFit.contain,),
        ),
        Container(
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 1500),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Text(
                  //       "Projects ",
                  //       style: TextStyle(
                  //           shadows: <Shadow>[
                  //             Shadow(
                  //               blurRadius: 0,
                  //               color: Colors.black,
                  //             ),
                  //           ],
                            
                            
                  //           fontWeight: FontWeight.w800,
                  //           fontSize: 60,
                  //           color: Color.fromARGB(255, 255, 255, 255)),
                  //     )
                  //   ],
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    CardContainer(1),
                    SizedBox(
                      width: 100,
                    ),
                    CardContainer(2),
                    SizedBox(
                      width: 100,
                    ),
                    CardContainer(3),
                  ]),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
