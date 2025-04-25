import 'package:flutter/material.dart';
import 'package:kaeport/Widgets/Pages/PageFour.dart';
import 'package:kaeport/Widgets/Pages/PageOne.dart';
import 'package:kaeport/Widgets/Pages/PageProjTwo.dart';
import 'package:kaeport/Widgets/Pages/PageThree.dart';
import 'package:kaeport/Widgets/Pages/PageTwo.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ScrollController controller = ScrollController(); 
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          controller: controller,
          
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            
            
            children: [
              PageOne(controller: controller,),
              PageTwo(),
              PageProjOne(),
              // PageProjTwo(),
              PageFour()
              
            ],
          ),
        ),
      ),
    );
  }
}


