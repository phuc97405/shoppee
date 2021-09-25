import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:shoppee/presentasion/Home/home_controller.dart';
import 'package:shoppee/shared/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'component/build_icon_tabbar.dart';
import 'component/build_pay.dart';
import 'component/build_slider.dart';
import 'component/rouded_input_field.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Builder(builder: (context) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: kSecondaryColor,
            automaticallyImplyLeading: false,
            actions: const [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: RoudedInputField(),
                ),
              ),
              buildIconTabBar(
                icon: Icons.add_shopping_cart_rounded,
                value: '36',
              ),
              buildIconTabBar(
                icon: Icons.message_outlined,
                value: '12',
              ),
              SizedBox(
                width: 8,
              )
            ],
          ),
          body:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(
                height: Get.height * 0.25,
                width: double.infinity,
                child: Stack(children: [
                  buildSlider(dataSlider: controller.dataSlider),
                  const Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: BuildPay(),
                      )),
                  Align(
                    // alignment: Alignment.bottomCenter, // not worker
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.dataSlider.length,
                        itemBuilder: (contex, index) {
                          return Obx(() => Text(
                                controller.currentPageSlider.value == index
                                    ? 'o'
                                    : ' - ',
                                style: const TextStyle(color: Colors.white),
                              ));
                        }),
                  ),
                ])),
            Container(
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
                                      border: Border.all(
                                          width: 1, color: Colors.grey),
                                      borderRadius: BorderRadius.circular(
                                          kDefaultFontSize),
                                    ),
                                    child: SvgPicture.asset(
                                      controller.listUtilities[index].urlIcon,
                                      placeholderBuilder:
                                          (BuildContext context) =>
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
                ]))
          ]),
          bottomNavigationBar: Obx(() => bottomNavigationBar()));
    });
  }

  BottomNavigationBar bottomNavigationBar() {
    return BottomNavigationBar(
      onTap: (value) {
        controller.selectionIndexBottomBar.value = value;
      },
      currentIndex: controller.selectionIndexBottomBar.value,
      type: BottomNavigationBarType.fixed,
      unselectedLabelStyle: const TextStyle(
          fontSize: kDefaultFontSize * 0.7, color: Colors.black),
      selectedFontSize: kDefaultFontSize * 0.7,
      selectedItemColor: kPrimaryColor,
      items: [
        BottomNavigationBarItem(
          icon: controller.selectionIndexBottomBar.value == 0
              ? Text(
                  '10.10',
                  style: TextStyle(
                      fontSize: kDefaultPadding,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold),
                )
              : Icon(
                  Icons.home,
                ),
          label: 'Gợi ý hôm nay',
        ),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.file_copy,
            ),
            label: 'Shoppee Feed'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.video_call_outlined,
            ),
            label: 'Shoppe Live'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications_none_outlined,
            ),
            label: 'Thông báo'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.people_alt_outlined,
            ),
            label: 'Tôi'),
      ],
    );
  }
}
