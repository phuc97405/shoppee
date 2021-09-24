import 'package:flutter/material.dart';
import 'package:shoppee/shared/constants.dart';

class RoudedInputField extends StatelessWidget {
  const RoudedInputField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {},
      cursorColor: kContentColorDarkTheme,
      decoration: InputDecoration(
          fillColor: kContentColorLightTheme.withOpacity(0.3),
          filled: true,
          prefixIcon: const Icon(
            Icons.search_outlined,
            color: Colors.black38,
            size: kDefaultPadding,
          ),
          suffixIcon: const Icon(
            Icons.camera_alt_outlined,
            color: Colors.black38,
            size: kDefaultPadding,
          ),
          hintText: '22.9 Siêu sale hoàn xu 50%',
          contentPadding: const EdgeInsets.only(
              left: kDefaultFontSize, bottom: 8.0, top: 8.0),
          hintStyle: const TextStyle(
              fontSize: kDefaultFontSize * 0.9, color: kPrimaryColor),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none)),
    );
  }
}
