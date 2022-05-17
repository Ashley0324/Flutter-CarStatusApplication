import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'color.dart';
import 'size.dart';

//Button Shadow Design
const List<BoxShadow> kBtnShadow = [
  BoxShadow(
    color: Color(0x33D83131),
    offset: Offset(0, 8),
    blurRadius: 20,
  )
];

// Title Text Design
const TextStyle kTitleTextStyle = TextStyle(
  fontSize: 24,
  color: Color(0xFF3D0007),
  fontWeight: FontWeight.w500,
);

//  Body Text Design
const TextStyle kBodyTextStyle = TextStyle(
  fontSize: 14,
  color: Color(0xFF3D0007),
  fontWeight: FontWeight.w300,
);

// Button Text Design
const TextStyle kBtnTextStyle = TextStyle(
  color: Color(0xFFFA6B74),
  fontSize: 18,
  fontWeight: FontWeight.w500,
);

//Input Border Design
InputBorder kInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(kInputBorderRadius),
  borderSide: BorderSide(
    width: 1,
    color: Color(0xFFECECEC),
  ),
);

