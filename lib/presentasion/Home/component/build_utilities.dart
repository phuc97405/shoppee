import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shoppee/shared/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../home_controller.dart';

class BuildUtilities extends StatelessWidget {
  const BuildUtilities({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(kDefaultFontSize * 0.5),
        color: kPrimaryColor,
        height: Get.height * 0.25,
        width: double.infinity,
        child: Stack(children: [
          GridView.count(
            crossAxisCount: 2,
            scrollDirection: Axis.horizontal,
            crossAxisSpacing: 5,
            mainAxisSpacing: 10,
            children: List.generate(
                controller.listUtilities.length,
                (index) => Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            height: 40,
                            width: 40,
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(width: 1, color: Colors.grey),
                              borderRadius:
                                  BorderRadius.circular(kDefaultFontSize),
                            ),
                            child: SvgPicture.asset(
                              controller.listUtilities[index].urlIcon,
                              placeholderBuilder: (BuildContext context) =>
                                  const CircularProgressIndicator(),
                            )),
                        Text(controller.listUtilities[index].title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: kDefaultFontSize * 0.6,
                                color: Colors.white))
                      ],
                    )),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: AnimatedSmoothIndicator(
                  activeIndex: 5,
                  count: (controller.listUtilities.length / 4).round(),
                  effect: const WormEffect(
                      spacing: 0.0,
                      radius: 0.0,
                      dotWidth: 10.0,
                      dotHeight: 5.0,
                      // paintStyle: PaintingStyle.stroke,
                      strokeWidth: 0.0,
                      dotColor: Colors.grey,
                      activeDotColor: Colors.white),
                ),
              ))
        ]));
  }
}
