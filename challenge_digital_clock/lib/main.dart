import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:challenge_digital_clock/clock_theme.dart';
import 'package:challenge_digital_clock/theme_changer.dart';
import 'package:provider/provider.dart';
import 'package:weather_icons/weather_icons.dart';

void main() async {
  await SystemChrome.setEnabledSystemUIOverlays([]);
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(NotifierApp());
}

class NotifierApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      // create: (_) => ThemeChanger(ClockTheme.dark),
      create: (_) => ThemeChanger(ClockTheme.light),
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Montserrat',
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime _dateTime;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _updateTime();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    ClockTheme _theme = ClockTheme(_themeChanger.getMode());
    return Scaffold(
      body: Container(
        decoration: _theme.containerDecoration,
        child: Container(
          decoration: _theme.opacityContainerDecoration,
          child: SafeArea(
            child: Stack(
              children: <Widget>[
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      FlatButton(
                        padding: EdgeInsets.all(0),
                        child: Text('Light'),
                        color: Colors.red,
                        onPressed: () =>
                            _themeChanger.setTheme(ClockTheme.light),
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        alignment: Alignment.bottomRight,
                        // color: Colors.red,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              'Monday,',
                              textAlign: TextAlign.right,
                              style: _theme.weekName,
                            ),
                            Text(
                              'January 29, 2019',
                              textAlign: TextAlign.right,
                              style: _theme.restDate,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  '20º',
                                  textAlign: TextAlign.right,
                                  style: _theme.temperature,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.today,
                                  size: 40,
                                  color: _theme.color,
                                ),
                              ],
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
                      FlatButton(
                        padding: EdgeInsets.all(0),
                        child: Text('Dark'),
                        color: Colors.blue,
                        onPressed: () =>
                            _themeChanger.setTheme(ClockTheme.dark),
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'São José dos Campos, SP, Brasil',
                          textAlign: TextAlign.left,
                          style: _theme.location,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: _calcCenter(350),
                  top: -80,
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
                  left: _calcCenter(400),
                  top: -20,
                  width: 400,
                  height: 220,
                  child: ClipRect(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        _fillWithZero(_dateTime.hour),
                        textAlign: TextAlign.center,
                        style: _theme.hour,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: _calcCenter(200),
                  bottom: 20,
                  width: 200,
                  height: 150,
                  child: ClipRect(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        _fillWithZero(_dateTime.minute),
                        textAlign: TextAlign.center,
                        style: _theme.minute,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
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

  double _calcCenter(double width) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double center = (deviceWidth - width) / 2;
    return center;
  }

  String _fillWithZero(int value) {
    var output = value.toString();
    if (value < 10) {
      output = '0$output';
    }
    return output;
  }
}
