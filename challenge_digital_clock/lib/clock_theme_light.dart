import 'package:challenge_digital_clock/clock_theme.dart';
import 'package:flutter/material.dart';

Color _lightColor = Color(0xFF303030);

class ClockThemeLight extends ClockTheme {
  ClockThemeLight(String highlighted) : super(highlighted);

  Color color = _lightColor;

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
            Color(0xFFE0E0E0),
            Color(0xFFC0C0C0),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      );

  Color get colorBall => Colors.white.withOpacity(0.3);

  Color get green => Colors.green;

  Color get blue => Colors.blue;

  Color get red => Colors.red;
}
