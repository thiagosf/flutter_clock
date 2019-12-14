import 'package:digital_clock/clock_theme.dart';
import 'package:flutter/material.dart';

Color _darkColor = Colors.white;

class ClockThemeDark extends ClockTheme {
  ClockThemeDark(String highlighted) : super(highlighted);

  Color color = _darkColor;

  Color highlightedColor() {
    const colors = {
      'green': Colors.green,
      'blue': Colors.blue,
      'red': Colors.red,
    };
    return colors[highlighted];
  }

  BoxDecoration get containerDecoration => BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF202020),
            Color(0xFF101010),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      );

  Color get colorBall => Colors.black.withOpacity(0.3);

  Color get green => Colors.green;

  Color get blue => Colors.blue;

  Color get red => Colors.red;
}
