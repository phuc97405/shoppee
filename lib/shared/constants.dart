import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFEE4D2D);
const kSecondaryColor = Color(0xFFFFF4F4);
const kContentColorLightTheme = Color(0xFF1D1D35);
const kContentColorDarkTheme = Color(0xFFF5FCF9);
const kWarninngColor = Color(0xFFF3BB1C);
const kErrorColor = Color(0xFFF03738);

const kDefaultPadding = 18.0;
const kDefaultFontSize = 16.0;
const textInputDercoration = InputDecoration(
  // icon: Icon(Icons.lock),
  // hintText: 'Password',
  fillColor: Colors.black26,
  filled: true,
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black26, width: 2)),
  focusedBorder:
      OutlineInputBorder(borderSide: BorderSide(color: Colors.black, width: 2)),
);
