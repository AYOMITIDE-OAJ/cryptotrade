import 'package:animator/animator.dart';
import 'package:cryptocurrencymarket/constance/constance.dart';
import 'package:cryptocurrencymarket/constance/global.dart';
import 'package:cryptocurrencymarket/constance/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cryptocurrencymarket/constance/global.dart' as globals;

class TransferMoney extends StatefulWidget {
  @override
  _TransferMoneyState createState() => _TransferMoneyState();
}

class _TransferMoneyState extends State<TransferMoney> {
  bool hidePoinButton = false;
  bool iswithDraw = false;

  String amonut = '';
  String oneValue = '';
  String secValue = '';
  String thirdValue = '';
  String fourthValue = '';
  String fifthValue = '';
  String sixthValue = '';
  String seventhValue = '';
  String eightthValue = '';

  @override
  Widget build(BuildContext context) {
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Animator(
                duration: Duration(seconds: 1),
                curve: Curves.decelerate,
                cycles: 1,
                builder: (anim) => Transform.scale(
                  scale: anim.value,
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.transparent,
                          border: Border.all(
                            color: AllCoustomTheme.getTextThemeColors(),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Animator(
                              tween: Tween<Offset>(begin: Offset(0, 0), end: Offset(0.2, 0)),
                              duration: Duration(seconds: 1),
                              cycles: 0,
                              builder: (anim) => FractionalTranslation(
                                translation: anim.value,
                                child: Icon(
                                  FontAwesomeIcons.angleLeft,
                                  color: AllCoustomTheme.getTextThemeColors(),
                                  size: 20,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Text(
                                'Bank choice',
                                style: TextStyle(
                                  color: AllCoustomTheme.getTextThemeColors(),
                                  fontFamily: 'Ubuntu',
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 100, right: 100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  '\$',
                  style: TextStyle(
                    color: AllCoustomTheme.getTextThemeColors(),
                    fontSize: ConstanceData.SIZE_TITLE25,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Ubuntu',
                  ),
                ),
                SizedBox(
                  width: 6,
                ),
                Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: <Widget>[
                    Container(
                      height: 1,
                      width: 90,
                      color: AllCoustomTheme.getTextThemeColors(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: amonut != ''
                          ? Text(
                              amonut,
                              style: TextStyle(
                                color: AllCoustomTheme.getTextThemeColors(),
                                fontSize: ConstanceData.SIZE_TITLE20,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : Text(
                              '0.0000000',
                              style: TextStyle(
                                color: AllCoustomTheme.getTextThemeColors(),
                                fontSize: ConstanceData.SIZE_TITLE20,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Ubuntu',
                              ),
                            ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: SizedBox(),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Animator(
              duration: Duration(seconds: 1),
              curve: Curves.decelerate,
              cycles: 1,
              builder: (anim) => Transform.scale(
                scale: anim.value,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {
                              pressButton('1');
                            },
                            child: PinNumberStyle(
                              digit: '1',
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {
                              pressButton('2');
                            },
                            child: PinNumberStyle(
                              digit: '2',
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {
                              pressButton('3');
                            },
                            child: PinNumberStyle(
                              digit: '3',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {
                              pressButton('4');
                            },
                            child: PinNumberStyle(
                              digit: '4',
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {
                              pressButton('5');
                            },
                            child: PinNumberStyle(
                              digit: '5',
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {
                              pressButton('6');
                            },
                            child: PinNumberStyle(
                              digit: '6',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {
                              pressButton('7');
                            },
                            child: PinNumberStyle(
                              digit: '7',
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {
                              pressButton('8');
                            },
                            child: PinNumberStyle(
                              digit: '8',
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {
                              pressButton('9');
                            },
                            child: PinNumberStyle(
                              digit: '9',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: <Widget>[
                        hidePoinButton == false
                            ? Expanded(
                                child: InkWell(
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap: () {
                                    pressButton('.');
                                    hideButton();
                                  },
                                  child: PinNumberStyle(
                                    digit: '.',
                                  ),
                                ),
                              )
                            : Expanded(
                                child: SizedBox(),
                              ),
                        Expanded(
                          child: InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {
                              pressButton('0');
                            },
                            child: PinNumberStyle(
                              digit: '0',
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {},
                            child: Icon(
                              Icons.keyboard_arrow_left,
                              size: 30,
                              color: AllCoustomTheme.getTextThemeColors(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10, top: 20),
                      child: !iswithDraw
                          ? FlatButton(
                              padding: EdgeInsets.all(0),
                              child: new Container(
                                height: 45.0,
                                alignment: FractionalOffset.center,
                                decoration: BoxDecoration(
                                  border: new Border.all(color: Colors.white, width: 1.5),
                                  borderRadius: new BorderRadius.circular(30),
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      globals.buttoncolor1,
                                      globals.buttoncolor2,
                                    ],
                                  ),
                                ),
                                child: new Text(
                                  "Withdraw to bank",
                                  style: new TextStyle(
                                    color: AllCoustomTheme.getReBlackAndWhiteThemeColors(),
                                    fontSize: ConstanceData.SIZE_TITLE16,
                                    fontFamily: 'Ubuntu',
                                  ),
                                ),
                              ),
                              onPressed: () {
                                withDrawToBank();
                              },
                            )
                          : SizedBox(
                              height: 48,
                              child: CupertinoActivityIndicator(
                                radius: 12,
                              ),
                            ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  withDrawToBank() async {
    setState(() {
      iswithDraw = true;
    });
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      iswithDraw = false;
    });
    Navigator.pop(context);
    openShowPopup();
  }

  openShowPopup() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: AllCoustomTheme.boxColor(),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Animator(
              duration: Duration(seconds: 1),
              cycles: 1,
              builder: (anim) => Transform.scale(
                scale: anim.value,
                child: Icon(
                  Icons.done,
                  color: Colors.green,
                  size: 30,
                ),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              'Congrats',
              style: TextStyle(
                color: AllCoustomTheme.getTextThemeColors(),
                fontWeight: FontWeight.bold,
                fontSize: ConstanceData.SIZE_TITLE25,
                fontFamily: 'Ubuntu',
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'You did succsessfully transfer \$$amonut Amount.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Ubuntu',
                color: AllCoustomTheme.getTextThemeColors(),
                fontSize: ConstanceData.SIZE_TITLE16,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Animator(
              duration: Duration(seconds: 1),
              cycles: 1,
              builder: (anim) => Transform.scale(
                scale: anim.value,
                child: FlatButton(
                  padding: EdgeInsets.all(0),
                  child: Container(
                    height: 45.0,
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
                      "Continue",
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        color: AllCoustomTheme.getReBlackAndWhiteThemeColors(),
                        fontSize: ConstanceData.SIZE_TITLE16,
                      ),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  hideButton() {
    setState(() {
      hidePoinButton = true;
    });
  }

  pressButton(String buttonNumber) {
    if (amonut != '') {
      if (amonut.length == 1) {
        setState(() {
          amonut = '$oneValue' + '$buttonNumber';
        });
        secValue = buttonNumber;
      } else if (amonut.length == 2) {
        setState(() {
          amonut = '$oneValue' + '$secValue' + '$buttonNumber';
        });
        thirdValue = buttonNumber;
      } else if (amonut.length == 3) {
        setState(() {
          amonut = '$oneValue' + '$secValue' + '$thirdValue' + '$buttonNumber';
        });
        fourthValue = buttonNumber;
      } else if (amonut.length == 4) {
        setState(() {
          amonut = '$oneValue' + '$secValue' + '$thirdValue' + '$fourthValue' + '$buttonNumber';
        });
        fifthValue = buttonNumber;
      } else if (amonut.length == 5) {
        setState(() {
          amonut = '$oneValue' + '$secValue' + '$thirdValue' + '$fourthValue' + '$fifthValue' + '$buttonNumber';
        });
        sixthValue = buttonNumber;
      } else if (amonut.length == 6) {
        setState(() {
          amonut = '$oneValue' + '$secValue' + '$thirdValue' + '$fourthValue' + '$fifthValue' + '$sixthValue' + '$buttonNumber';
        });
        seventhValue = buttonNumber;
      } else if (amonut.length == 7) {
        setState(() {
          amonut = '$oneValue' + '$secValue' + '$thirdValue' + '$fourthValue' + '$fifthValue' + '$sixthValue' + '$seventhValue' + '$buttonNumber';
        });
        eightthValue = buttonNumber;
      } else if (amonut.length == 8) {
        setState(() {
          amonut = '$oneValue' +
              '$secValue' +
              '$thirdValue' +
              '$fourthValue' +
              '$fifthValue' +
              '$sixthValue' +
              '$seventhValue' +
              '$eightthValue' +
              '$buttonNumber';
        });
      }
    } else {
      setState(() {
        amonut = buttonNumber;
      });
      oneValue = amonut;
    }
  }
}
