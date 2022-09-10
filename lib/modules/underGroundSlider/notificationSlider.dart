import 'package:animator/animator.dart';
import 'package:cryptocurrencymarket/constance/constance.dart';
import 'package:cryptocurrencymarket/constance/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotificationSlider extends StatefulWidget {
  @override
  _NotificationSliderState createState() => _NotificationSliderState();
}

class _NotificationSliderState extends State<NotificationSlider> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Animator(
                    tween: Tween<Offset>(
                      begin: Offset(0, -0.2),
                      end: Offset(0, 0),
                    ),
                    duration: Duration(seconds: 1),
                    cycles: 0,
                    builder: (anim) => FractionalTranslation(
                      translation: anim.value,
                      child: InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          FontAwesomeIcons.angleDown,
                          color: AllCoustomTheme.getTextThemeColors(),
                          size: 35,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: <Widget>[
                Animator(
                  tween: Tween<double>(begin: 0, end: 1),
                  duration: Duration(seconds: 1),
                  cycles: 1,
                  builder: (anim) => SizeTransition(
                    sizeFactor: anim,
                    axis: Axis.horizontal,
                    axisAlignment: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Text(
                        'Notifications',
                        style: TextStyle(
                          color: AllCoustomTheme.getTextThemeColors(),
                          fontSize: ConstanceData.SIZE_TITLE20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Ubuntu',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 10),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Push-Notifications',
                        style: TextStyle(
                          color: AllCoustomTheme.getTextThemeColors(),
                          fontSize: ConstanceData.SIZE_TITLE16,
                          fontFamily: 'Ubuntu',
                        ),
                      ),
                      CupertinoSwitch(
                        activeColor: Colors.blue,
                        value: _lights,
                        onChanged: (bool value) {
                          setState(() {
                            _lights = value;
                          });
                        },
                      ),
                    ],
                  ),
                  Divider(
                    color: AllCoustomTheme.getTextThemeColors(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'End of the day',
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                          color: AllCoustomTheme.getTextThemeColors(),
                          fontSize: ConstanceData.SIZE_TITLE16,
                        ),
                      ),
                      CupertinoSwitch(
                        activeColor: Colors.blue,
                        value: endOfDay,
                        onChanged: (bool value) {
                          setState(() {
                            endOfDay = value;
                          });
                        },
                      ),
                    ],
                  ),
                  Divider(
                    color: AllCoustomTheme.getTextThemeColors(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'New release available',
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                          color: AllCoustomTheme.getTextThemeColors(),
                          fontSize: ConstanceData.SIZE_TITLE16,
                        ),
                      ),
                      CupertinoSwitch(
                        activeColor: Colors.blue,
                        value: _lights,
                        onChanged: (bool value) {
                          setState(() {
                            _lights = value;
                          });
                        },
                      ),
                    ],
                  ),
                  Divider(
                    color: AllCoustomTheme.getTextThemeColors(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Other notifications',
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                          color: AllCoustomTheme.getTextThemeColors(),
                          fontSize: ConstanceData.SIZE_TITLE16,
                        ),
                      ),
                      CupertinoSwitch(
                        activeColor: Colors.blue,
                        value: endOfDay,
                        onChanged: (bool value) {
                          setState(() {
                            endOfDay = value;
                          });
                        },
                      ),
                    ],
                  ),
                  Divider(
                    color: AllCoustomTheme.getTextThemeColors(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _lights = true;
  bool endOfDay = false;
}
