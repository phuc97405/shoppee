import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:shoppee/presentasion/Home/home_controller.dart';
import 'package:shoppee/shared/constants.dart';

import 'component/build_icon_tabbar.dart';
import 'component/build_pay.dart';
import 'component/build_slider.dart';
import 'component/build_utilities.dart';
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
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
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
          body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
                                      controller.currentPageSlider.value ==
                                              index
                                          ? 'o'
                                          : ' - ',
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ));
                              }),
                        ),
                      ])),
                  BuildUtilities(controller: controller),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    height: Get.height * 0.15,
                    width: double.infinity,
                    decoration: const BoxDecoration(color: kPrimaryColor),
                    child: Row(
                      children: [
                        Expanded(
                          child: buildPromotion(
                              'assets/images/images.png', 'CHƠI NGAY'),
                        ),
                        const SizedBox(
                          width: kDefaultPadding * 0.5,
                        ),
                        Expanded(
                          flex: 2,
                          child: buildPromotion(
                              'assets/images/tonghop-facebook-ads.jpeg',
                              'SĂN NGAY'),
                        ),
                        const SizedBox(
                          width: kDefaultPadding * 0.5,
                        ),
                        Expanded(
                          child: buildPromotion(
                              'assets/images/facebook-ads1.png', 'CHƠI NGAY'),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: Get.height * 0.2,
                    color: Colors.orange[100],
                    width: double.infinity,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'SẢN PHẨM BÁN CHẠY',
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: kDefaultFontSize * 0.8,
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                      onTap: () {},
                                      child: Text('Xem Thêm',
                                          style: TextStyle(
                                              color: kPrimaryColor,
                                              fontSize:
                                                  kDefaultFontSize * 0.7))),
                                  Icon(
                                    Icons.navigate_next_outlined,
                                    color: kPrimaryColor,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return Container(
                                  width: 100,
                                  height: double.infinity,
                                  margin: EdgeInsets.symmetric(horizontal: 1),
                                  decoration:
                                      BoxDecoration(color: Colors.transparent),
                                  child: Column(
                                    children: [
                                      Expanded(
                                          flex: 8,
                                          child: Stack(children: [
                                            Image.asset(
                                              'assets/images/images.png',
                                              height: double.infinity,
                                              width: double.infinity,
                                              fit: BoxFit.cover,
                                            ),
                                            Align(
                                              alignment: Alignment.topRight,
                                              child: Container(
                                                  child: Text('50% \nGiam',
                                                      style: TextStyle(
                                                          color: kPrimaryColor,
                                                          fontSize:
                                                              kDefaultFontSize *
                                                                  0.5))),
                                            )
                                          ])),
                                      Expanded(
                                          flex: 2,
                                          child: Center(
                                              child: Text('đ50.000',
                                                  style: TextStyle(
                                                      color: kPrimaryColor,
                                                      fontSize:
                                                          kDefaultFontSize))))
                                    ],
                                  ),
                                );
                              }),
                        )
                      ],
                    ),
                  )
                ]),
          ),
          bottomNavigationBar: Obx(() => bottomNavigationBar()));
    });
  }

  Stack buildPromotion(String urlImage, String title) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            urlImage,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Chip(
              backgroundColor: Colors.white,
              deleteIcon: Container(
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: kPrimaryColor),
                child: Icon(
                  Icons.navigate_next_outlined,
                  size: kDefaultPadding * 0.8,
                ),
              ),
              deleteIconColor: Colors.white,
              onDeleted: () {},
              label: Text(
                title,
                style: const TextStyle(
                    color: kPrimaryColor,
                    fontSize: kDefaultFontSize * 0.5,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        )
      ],
    );
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
              ? const Text(
                  '10.10',
                  style: TextStyle(
                      fontSize: kDefaultPadding,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold),
                )
              : const Icon(
                  Icons.home,
                ),
          label: 'Gợi ý hôm nay',
        ),
        const BottomNavigationBarItem(
            icon: Icon(
              Icons.file_copy,
            ),
            label: 'Shoppee Feed'),
        const BottomNavigationBarItem(
            icon: Icon(
              Icons.video_call_outlined,
            ),
            label: 'Shoppe Live'),
        BottomNavigationBarItem(
            icon: Stack(children: [
              const Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.notifications_active_outlined,
                  )),
              Align(
                  alignment: const Alignment(0.7, 1),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(15)),
                    // alignment: Alignment.center,
                    child: const Text('99+',
                        style: TextStyle(
                          fontSize: kDefaultFontSize * 0.7,
                          color: Colors.white,
                        )),
                  ))
            ]),
            label: 'Thông báo'),
        const BottomNavigationBarItem(
            icon: Icon(
              Icons.people_alt_outlined,
            ),
            label: 'Tôi'),
      ],
    );
  }
}
