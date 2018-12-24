import 'package:devfest_18_kolkata/theme.dart';
import 'package:flutter/material.dart';

List<Color> googleColorsList = [
  googleBlue,
  googleRed,
  googleYellow,
  googleGreen,
];

List flexValueForLowerBorderColors = [4, 1, 1, 1];

List<Widget> colorsList = List.generate(
  googleColorsList.length,
  (i) => Expanded(
        flex: flexValueForLowerBorderColors[i],
        child: Container(
          color: googleColorsList[i],
        ),
      ),
);

Widget bottomBorder({double width}) => Container(
      height: 5.5,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(10.0),
          bottomLeft: Radius.circular(10.0),
        ),
        child: Row(
          children: colorsList,
        ),
      ),
    );
