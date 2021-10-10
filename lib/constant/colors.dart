import 'package:flutter/material.dart';

const skeletonGradient = LinearGradient(
  colors: [kGray, kLightGray, kGray],
  stops: [0, 0.5, 1],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
);
const kLinearGradient = LinearGradient(
  colors: [kGradientStart, kGradientEnd],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);
const kGradientStart = Color(0xFFF62E8E);
const kGradientEnd = Color(0xFFAC1AF0);
const kPink = Color(0xFFF62E8E);
const kBlue = Color(0xFF2E8AF6);
const kDarkBlack = Color(0xFF181A1C);
const kLightWhite = Color(0xFFECEBED);
const kBlack = Color(0xFF000000);
const kWhite = Color(0xFFFFFFFF);
const kGray = Color(0xFF323436);
const kLightGray = Color(0xFF727477);
