import 'package:animator/animator.dart';
import 'package:cryptocurrencymarket/constance/constance.dart';
import 'package:cryptocurrencymarket/constance/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cryptocurrencymarket/constance/global.dart' as globals;

class SetSchedule extends StatefulWidget {
  @override
  _SetScheduleState createState() => _SetScheduleState();
}

class _SetScheduleState extends State<SetSchedule> {
  var genderListIndex = 2;
  var timeScheduleList = ['Daily', 'Weekly', 'Monthly', '3 Months', '6 Months', '12 Months', '1 Year', '2 Year'];

  @override
  Widget build(BuildContext context) {
    final FixedExtentScrollController scrollController = FixedExtentScrollController(initialItem: genderListIndex);
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        children: <Widget>[
          Row(
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
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Select schedule',
                style: TextStyle(color: AllCoustomTheme.getTextThemeColors(), fontSize: ConstanceData.SIZE_TITLE20, fontFamily: 'Ubuntu'),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Animator(
              duration: Duration(seconds: 1),
              cycles: 1,
              builder: (anim) => Transform.scale(
                scale: anim.value,
                child: CupertinoPicker(
                  itemExtent: 44,
                  backgroundColor: Colors.transparent,
                  onSelectedItemChanged: (int index) {},
                  useMagnifier: true,
                  scrollController: scrollController,
                  looping: true,
                  children: List<Widget>.generate(timeScheduleList.length, (int index) {
                    return Center(
                      child: Text(
                        timeScheduleList[index][0].toUpperCase() + timeScheduleList[index].substring(1).toLowerCase(),
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                          color: AllCoustomTheme.getTextThemeColors(),
                          fontSize: ConstanceData.SIZE_TITLE20,
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16, left: 16, bottom: 20),
            child: Animator(
              duration: Duration(seconds: 1),
              cycles: 1,
              builder: (anim) => Transform.scale(
                scale: anim.value,
                child: FlatButton(
                  padding: EdgeInsets.all(0),
                  child: Container(
                    height: 40.0,
                    alignment: FractionalOffset.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 1.5),
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          globals.buttoncolor1,
                          globals.buttoncolor2,
                        ],
                      ),
                    ),
                    child: Text(
                      "Done",
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        color: AllCoustomTheme.getReBlackAndWhiteThemeColors(),
                        fontSize: ConstanceData.SIZE_TITLE16,
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
