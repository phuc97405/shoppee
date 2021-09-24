import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shoppee/presentasion/Home/home_controller.dart';

class buildSlider extends GetView<HomeController> {
  const buildSlider({
    Key? key,
    required List dataSlider,
  })  : _dataSlider = dataSlider,
        super(key: key);

  final List _dataSlider;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: _dataSlider.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/${_dataSlider[itemIndex]}'))),
      ),
      options: CarouselOptions(
        height: Get.height * 0.2,
        viewportFraction: 1,

        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 500),
        // aspectRatio: 2.0,
        autoPlay: true,
        onPageChanged: (index, reason) {
          controller.changeSlider(index);
        },
        // initialPage: 3,
      ),
    );
  }
}
