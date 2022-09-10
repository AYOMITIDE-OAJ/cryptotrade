import 'package:animator/animator.dart';
import 'package:cryptocurrencymarket/constance/constance.dart';
import 'package:cryptocurrencymarket/constance/routes.dart';
import 'package:cryptocurrencymarket/constance/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cryptocurrencymarket/constance/global.dart' as globals;

class IntroductionScreen extends StatefulWidget {
  @override
  _IntroductionScreenState createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> with SingleTickerProviderStateMixin {
  bool _visible = false;

  AnimationController controller;
  Animation<Offset> offset;

  @override
  void initState() {
    super.initState();
    animationText();
    secoundAnimation();
  }

  animationText() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _visible = true;
    });
  }

  secoundAnimation() {
    controller = AnimationController(vsync: this, duration: Duration(seconds: 1));

    offset = Tween<Offset>(begin: Offset.zero, end: Offset(0.0, 1)).animate(controller);

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Container(
      height: height,
      child: Stack(
        children: <Widget>[
          Container(
            foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  HexColor(globals.primaryColorString).withOpacity(0.6),
                  HexColor(globals.primaryColorString).withOpacity(0.6),
                  HexColor(globals.primaryColorString).withOpacity(0.6),
                  HexColor(globals.primaryColorString).withOpacity(0.6),
                ],
              ),
            ),
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                ConstanceData.appIcon,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Container(
                constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height, minWidth: MediaQuery.of(context).size.width),
                child: Padding(
                  padding: EdgeInsets.only(right: 16, left: 16, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      AnimatedOpacity(
                        duration: Duration(milliseconds: 500),
                        opacity: _visible ? 1.0 : 0.0,
                        child: Text(
                          'Safest digital \nblockchain \nplatform',
                          style: TextStyle(
                            color: AllCoustomTheme.getTextThemeColors(),
                            fontSize: 38,
                            letterSpacing: 0.8,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SlideTransition(
                        position: offset,
                        transformHitTests: false,
                        child: Text(
                          'Choosing The Right Path',
                          style: TextStyle(
                            color: AllCoustomTheme.getTextThemeColors(),
                            fontSize: ConstanceData.SIZE_TITLE14,
                            letterSpacing: 0.8,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          goToNextScreen();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            !isClickButton
                                ? Animator(
                                    tween: Tween<double>(begin: 0.8, end: 1.1),
                                    curve: Curves.easeInToLinear,
                                    cycles: 0,
                                    builder: (anim) => Transform.scale(
                                      scale: anim.value,
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          border: new Border.all(color: Colors.white, width: 1.5),
                                          shape: BoxShape.circle,
                                          gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              globals.buttoncolor1,
                                              globals.buttoncolor2,
                                            ],
                                          ),
                                        ),
                                        child: Padding(
                                            padding: const EdgeInsets.only(left: 3),
                                            child: Icon(
                                              Icons.arrow_forward_ios,
                                              size: 20,
                                              color: AllCoustomTheme.getTextThemeColors(),
                                            )),
                                      ),
                                    ),
                                  )
                                : Container(
                                    padding: const EdgeInsets.only(right: 15),
                                    height: 50,
                                    child: CupertinoActivityIndicator(
                                      radius: 12,
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
          )
        ],
      ),
    );
  }

  bool isClickButton = false;

  goToNextScreen() async {
    setState(() {
      isClickButton = true;
    });
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      isClickButton = false;
    });
    Navigator.pushReplacementNamed(
      context,
      Routes.SwipeIntrodution,
    );
  }
}
