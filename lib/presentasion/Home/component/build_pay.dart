import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shoppee/shared/constants.dart';

class BuildPay extends StatelessWidget {
  const BuildPay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.06,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(boxShadow: [
        const BoxShadow(
            offset: Offset(4, 0), blurRadius: 10, color: Colors.grey)
      ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
      width: double.infinity,
      child: Row(
        children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.qr_code)),
          const VerticalDivider(
            color: Colors.grey,
            thickness: 1,
            indent: 0,
            endIndent: 0,
            width: 20,
          ),
          const buildItemPay(
            icon: Icons.money,
            title: 'Ví ShoppePay',
            subTitle: 'Giảm ngay 10%',
          ),
          const VerticalDivider(
            color: Colors.grey,
            thickness: 1,
            indent: 0,
            endIndent: 0,
            width: 20,
          ),
          const buildItemPay(
            icon: Icons.monetization_on,
            title: '15,700 Xu',
            subTitle: 'Đổi xu lấy mã giảm giá',
          ),
        ],
      ),
    );
  }
}

class buildItemPay extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subTitle;

  const buildItemPay(
      {Key? key,
      required this.icon,
      required this.title,
      required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: kPrimaryColor,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: TextStyle(fontSize: kDefaultFontSize * 0.8),
            ),
          ],
        ),
        Text(
          subTitle,
          style: TextStyle(
              fontSize: kDefaultFontSize * 0.5, color: Colors.black45),
        ),
      ],
    ));
  }
}
