import 'package:flutter/material.dart';

const String FontNameDefault = 'Montserrat';

enum _Element {
  color,
  hour,
  minute,
  location,
  temperature,
  date,
  icon,
  containerDecoration,
  opacityContainerDecoration,
  colorBall,
  weekName,
  restDate,
}

final _fontFamily = 'Montserrat';

final _baseTheme = {
  _Element.hour: TextStyle(
    fontFamily: _fontFamily,
    fontSize: 180,
    fontWeight: FontWeight.w900,
  ),
  _Element.minute: TextStyle(
    fontFamily: _fontFamily,
    fontSize: 120,
    fontWeight: FontWeight.w400,
  ),
  _Element.location: TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  ),
  _Element.temperature: TextStyle(
    fontFamily: _fontFamily,
    fontSize: 26,
    fontWeight: FontWeight.w900,
  ),
  _Element.weekName: TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w900,
  ),
  _Element.restDate: TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  ),
};

Color _darkColor = Colors.white;
final _darkTheme = {
  _Element.color: _darkColor,
  _Element.hour: _baseTheme[_Element.hour].copyWith(
    color: Color(0xFF73D167),
  ),
  _Element.minute: _baseTheme[_Element.minute].copyWith(
    color: _darkColor,
  ),
  _Element.location: _baseTheme[_Element.location].copyWith(
    color: _darkColor,
  ),
  _Element.temperature: _baseTheme[_Element.temperature].copyWith(
    color: _darkColor,
  ),
  _Element.containerDecoration: BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color(0xFF202020),
        Color(0xFF101010),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  ),
  _Element.opacityContainerDecoration: BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color(0x0073D167),
        Color(0x2273D167),
        Color(0x0073D167),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  ),
  _Element.colorBall: Colors.black.withOpacity(0.3),
  _Element.weekName: _baseTheme[_Element.weekName].copyWith(
    color: Colors.white,
  ),
  _Element.restDate: _baseTheme[_Element.restDate].copyWith(
    color: _darkColor,
  ),
};

Color _lightColor = Color(0xFF303030);
final _lightTheme = {
  _Element.color: _lightColor,
  _Element.hour: _baseTheme[_Element.hour].copyWith(
    color: Color(0xFF73D167),
  ),
  _Element.minute: _baseTheme[_Element.minute].copyWith(
    color: _lightColor,
  ),
  _Element.location: _baseTheme[_Element.location].copyWith(
    color: _lightColor,
  ),
  _Element.temperature: _baseTheme[_Element.temperature].copyWith(
    color: _lightColor,
  ),
  _Element.containerDecoration: BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color(0xFFE0E0E0),
        Color(0xFFC0C0C0),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  ),
  _Element.opacityContainerDecoration: BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color(0x0073D167),
        Color(0x6673D167),
        Color(0x0073D167),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  ),
  _Element.colorBall: Colors.white.withOpacity(0.3),
  _Element.weekName: _baseTheme[_Element.weekName].copyWith(
    color: _lightColor,
  ),
  _Element.restDate: _baseTheme[_Element.restDate].copyWith(
    color: _lightColor,
  ),
};

class ClockTheme {
  static final String light = 'light';
  static final String dark = 'dark';
  final String _mode;
  // String _highlightedColor;

  ClockTheme(this._mode);

  getMode() {
    final items = {
      'light': _lightTheme,
      'dark': _darkTheme,
    };
    return items[this._mode];
  }

  Color get color => getMode()[_Element.color];
  TextStyle get hour => getMode()[_Element.hour];
  TextStyle get minute => getMode()[_Element.minute];
  BoxDecoration get containerDecoration =>
      getMode()[_Element.containerDecoration];
  BoxDecoration get opacityContainerDecoration =>
      getMode()[_Element.opacityContainerDecoration];
  Color get colorBall => getMode()[_Element.colorBall];
  TextStyle get location => getMode()[_Element.location];
  TextStyle get temperature => getMode()[_Element.temperature];
  TextStyle get weekName => getMode()[_Element.weekName];
  TextStyle get restDate => getMode()[_Element.restDate];
}
