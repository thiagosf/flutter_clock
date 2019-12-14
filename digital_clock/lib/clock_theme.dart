import 'package:flutter/material.dart';

final _fontFamily = 'Montserrat';

abstract class ClockTheme {
  final String highlighted;

  ClockTheme(this.highlighted);

  Color color;

  Color highlightedColor();

  TextStyle get hour => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 180,
        fontWeight: FontWeight.w900,
        color: highlightedColor(),
      );

  TextStyle get minute => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 120,
        fontWeight: FontWeight.w400,
        color: color,
      );

  TextStyle get hourFormat => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 50,
        fontWeight: FontWeight.w400,
        color: color,
      );

  TextStyle get location => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: color,
      );

  TextStyle get temperature => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 26,
        fontWeight: FontWeight.w900,
        color: color,
      );

  TextStyle get temperatureUnit => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 26,
        fontWeight: FontWeight.w400,
        color: color,
      );

  BoxDecoration get containerDecoration;

  BoxDecoration get opacityContainerDecoration => BoxDecoration(
        gradient: LinearGradient(
          colors: [
            highlightedColor().withAlpha(0),
            highlightedColor().withAlpha(60),
            highlightedColor().withAlpha(0),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      );

  Color get colorBall;

  TextStyle get weekName => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w900,
        color: color,
      );

  TextStyle get restDate => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: color,
      );

  Color get green;

  Color get blue;

  Color get red;
}
