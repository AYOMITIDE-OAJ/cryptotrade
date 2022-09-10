import 'package:animator/animator.dart';
import 'package:cryptocurrencymarket/constance/constance.dart';
import 'package:cryptocurrencymarket/constance/global.dart';
import 'package:cryptocurrencymarket/constance/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cryptocurrencymarket/constance/global.dart' as globals;
import 'package:modal_progress_hud/modal_progress_hud.dart';

class ChangePINCode extends StatefulWidget {
  @override
  _ChangePINCodeState createState() => _ChangePINCodeState();
}

class _ChangePINCodeState extends State<ChangePINCode> {
  bool _isInProgress = false;

  var height = 0.0;
  var width = 0.0;

  @override
  void initState() {
    loadUserDetails();
    super.initState();
  }

  loadUserDetails() async {
    setState(() {
      _isInProgress = true;
    });
    await Future.delayed(const Duration(milliseconds: 700));
    setState(() {
      _isInProgress = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar();
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    double appBarheight = appBar.preferredSize.height;
    return Stack(
      children: <Widget>[
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                HexColor(globals.primaryColorString).withOpacity(0.9),
                HexColor(globals.primaryColorString).withOpacity(0.9),
                HexColor(globals.primaryColorString).withOpacity(0.9),
                HexColor(globals.primaryColorString).withOpacity(0.9),
              ],
            ),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              ConstanceData.authImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SafeArea(
          bottom: true,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: ModalProgressHUD(
              inAsyncCall: _isInProgress,
              opacity: 0,
              progressIndicator: CupertinoActivityIndicator(
                radius: 12,
              ),
              child: !_isInProgress
                  ? Column(
                      children: <Widget>[
                        SizedBox(
                          height: appBarheight,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16, left: 16),
                          child: Row(
                            children: <Widget>[
                              InkWell(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Animator(
                                  tween: Tween<Offset>(
                                      begin: Offset(0, 0), end: Offset(0.2, 0)),
                                  duration: Duration(seconds: 1),
                                  cycles: 0,
                                  builder: (anim) => FractionalTranslation(
                                    translation: anim.value,
                                    child: Icon(
                                      Icons.arrow_back_ios,
                                      color:
                                          AllCoustomTheme.getTextThemeColors(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: SizedBox(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Animator(
                              duration: Duration(seconds: 1),
                              curve: Curves.decelerate,
                              cycles: 1,
                              builder: (anim) => Transform.scale(
                                scale: anim.value,
                                child: Text(
                                  'Enter PIN-Code',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: AllCoustomTheme.getTextThemeColors(),
                                    fontWeight: FontWeight.bold,
                                    fontSize: ConstanceData.SIZE_TITLE18,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        totalPinNumber >= 5
                            ? Animator(
                                tween: Tween<Offset>(
                                    begin: Offset(-3, 0), end: Offset(3, 0)),
                                duration: Duration(seconds: 1),
                                cycles: 2,
                                builder: (anim) => Transform(
                                  transform: Matrix4.translationValues(
                                      anim.value.dx, 0, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      isSelectbutton1
                                          ? PinEnable()
                                          : PinDisable(),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      isSelectbutton2
                                          ? PinEnable()
                                          : PinDisable(),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      isSelectbutton3
                                          ? PinEnable()
                                          : PinDisable(),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      isSelectbutton4
                                          ? PinEnable()
                                          : PinDisable(),
                                    ],
                                  ),
                                ),
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  isSelectbutton1 ? PinEnable() : PinDisable(),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  isSelectbutton2 ? PinEnable() : PinDisable(),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  isSelectbutton3 ? PinEnable() : PinDisable(),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  isSelectbutton4 ? PinEnable() : PinDisable(),
                                ],
                              ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Forgot?',
                              style: TextStyle(
                                color:
                                    AllCoustomTheme.getsecoundTextThemeColor(),
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
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
                                            isPressNumberButton1();
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
                                            isPressNumberButton1();
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
                                            isPressNumberButton1();
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
                                            isPressNumberButton1();
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
                                            isPressNumberButton1();
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
                                            isPressNumberButton1();
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
                                            isPressNumberButton1();
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
                                            isPressNumberButton1();
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
                                            isPressNumberButton1();
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
                                      Expanded(child: SizedBox()),
                                      Expanded(
                                        child: InkWell(
                                          highlightColor: Colors.transparent,
                                          splashColor: Colors.transparent,
                                          onTap: () {
                                            isPressNumberButton1();
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
                                          onTap: () {
                                            removePin();
                                          },
                                          child: Icon(
                                            Icons.keyboard_arrow_left,
                                            size: 30,
                                            color: AllCoustomTheme
                                                .getsecoundTextThemeColor(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  : SizedBox(),
            ),
          ),
        )
      ],
    );
  }

  bool isSelectbutton1 = false;
  bool isSelectbutton2 = false;
  bool isSelectbutton3 = false;
  bool isSelectbutton4 = false;

  isPressNumberButton1() {
    if (!isSelectbutton1) {
      setState(() {
        isSelectbutton1 = true;
      });
      totalPinNumber++;
    } else if (!isSelectbutton2) {
      setState(() {
        isSelectbutton2 = true;
      });
      totalPinNumber++;
    } else if (!isSelectbutton3) {
      setState(() {
        isSelectbutton3 = true;
      });
      totalPinNumber++;
    } else if (!isSelectbutton4) {
      setState(() {
        isSelectbutton4 = true;
      });
      totalPinNumber++;
    } else {
      setState(() {
        totalPinNumber++;
      });
    }
  }

  int totalPinNumber = 0;

  removePin() {
    isSelectbutton4
        ? setState(() {
            isSelectbutton4 = false;
            totalPinNumber--;
          })
        : isSelectbutton3
            ? setState(() {
                isSelectbutton3 = false;
                totalPinNumber--;
              })
            : isSelectbutton2
                ? setState(() {
                    isSelectbutton2 = false;
                    totalPinNumber--;
                  })
                : isSelectbutton1
                    ? setState(() {
                        isSelectbutton1 = false;
                        totalPinNumber--;
                      })
                    : setState(() {
                        totalPinNumber--;
                      });
  }
}
