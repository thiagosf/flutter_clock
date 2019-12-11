import 'dart:async';
import 'package:challenge_digital_clock/clock_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clock_helper/model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class DigitalClock extends StatefulWidget {
  final ClockModel model;

  DigitalClock(this.model);

  @override
  _DigitalClockState createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  DateTime _dateTime;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    widget.model.addListener(_updateModel);
    _updateTime();
    _updateModel();
  }

  @override
  void didUpdateWidget(DigitalClock oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.model != oldWidget.model) {
      oldWidget.model.removeListener(_updateModel);
      widget.model.addListener(_updateModel);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    widget.model.removeListener(_updateModel);
    widget.model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = Theme.of(context).brightness == Brightness.light
        ? ClockTheme.light
        : ClockTheme.dark;
    ClockTheme _theme = ClockTheme(themeMode);
    final hour =
        DateFormat(widget.model.is24HourFormat ? 'HH' : 'hh').format(_dateTime);
    final minute = DateFormat('mm').format(_dateTime);
    final weekName = DateFormat('EEEE,').format(_dateTime);
    final restDate = DateFormat('LLLL d, y').format(_dateTime);
    final weatherIcon = _getWeatherIcon(_theme);

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          decoration: _theme.containerDecoration,
          child: Container(
            decoration: _theme.opacityContainerDecoration,
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: _calcCenter(350, constraints),
                  top: -100,
                  width: 350,
                  height: 350,
                  child: ClipOval(
                    child: Container(
                      color: _theme.colorBall,
                      width: 400,
                      height: 400,
                    ),
                  ),
                ),
                Positioned(
                  left: _calcCenter(400, constraints),
                  top: -10,
                  width: 400,
                  height: 220,
                  child: ClipRect(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        hour,
                        textAlign: TextAlign.center,
                        style: _theme.hour,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: _calcCenter(200, constraints),
                  bottom: 20,
                  width: 200,
                  height: 150,
                  child: ClipRect(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        minute,
                        textAlign: TextAlign.center,
                        style: _theme.minute,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      widget.model.temperatureString,
                      textAlign: TextAlign.right,
                      style: _theme.temperature,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.only(
                      right: 5,
                    ),
                    child: Container(
                      width: 80,
                      height: 80,
                      child: weatherIcon,
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(15),
                        alignment: Alignment.bottomRight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              weekName,
                              textAlign: TextAlign.right,
                              style: _theme.weekName,
                            ),
                            Text(
                              restDate,
                              textAlign: TextAlign.right,
                              style: _theme.restDate,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 0,
                  bottom: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(15),
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          widget.model.location,
                          textAlign: TextAlign.left,
                          style: _theme.location,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _updateTime() {
    setState(() {
      _dateTime = DateTime.now();
      _timer = Timer(
        Duration(minutes: 1) -
            Duration(seconds: _dateTime.second) -
            Duration(milliseconds: _dateTime.millisecond),
        _updateTime,
      );
    });
  }

  double _calcCenter(double width, BoxConstraints constraints) {
    double containerWidth = constraints.constrainWidth();
    double center = (containerWidth - width) / 2;
    return center;
  }

  void _updateModel() {
    setState(() {
      // Cause the clock to rebuild when the model changes.
    });
  }

  Widget _getWeatherIcon(ClockTheme theme) {
    final name = widget.model.weatherCondition.toString().split('.').last;
    return SvgPicture.asset(
      'assets/icons/$name.svg',
      color: theme.color,
      semanticsLabel: name,
    );
  }
}
