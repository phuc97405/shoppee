import 'package:flutter/material.dart';
import 'package:shoppee/shared/constants.dart';

class buildIconTabBar extends StatelessWidget {
  final IconData icon;
  final String value;
  const buildIconTabBar({Key? key, required this.icon, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          right: 5,
          top: 5,
          child: Container(
            height: 16,
            width: 16,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: kPrimaryColor),
            child: Center(
              child: Text(
                value,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: kContentColorDarkTheme,
                    fontSize: kDefaultFontSize * 0.5),
              ),
            ),
          ),
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(
              icon,
              color: kPrimaryColor,
              size: kDefaultPadding * 1.2,
            ))
      ],
    );
  }
}
