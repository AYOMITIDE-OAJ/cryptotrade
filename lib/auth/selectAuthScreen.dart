import 'package:cryptocurrencymarket/auth/signInScreen.dart';
import 'package:cryptocurrencymarket/constance/constance.dart';
import 'package:cryptocurrencymarket/constance/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cryptocurrencymarket/constance/global.dart' as globals;
import 'package:gradient_text/gradient_text.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'signUpScreen.dart';

class SelectAuthScreen extends StatefulWidget {
  @override
  _SelectAuthScreenState createState() => _SelectAuthScreenState();
}

class _SelectAuthScreenState extends State<SelectAuthScreen> {
  bool _visible = false;
  bool _visibleButtons = false;
  bool _isInProgress = false;

  @override
  void initState() {
    super.initState();
    animationText();
  }

  animationText() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _visible = true;
    });
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      _visibleButtons = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                HexColor(globals.primaryColorString).withOpacity(0.4),
                HexColor(globals.primaryColorString).withOpacity(0.4),
                HexColor(globals.primaryColorString).withOpacity(0.5),
                HexColor(globals.primaryColorString).withOpacity(0.6),
              ],
            ),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              ConstanceData.authImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: ModalProgressHUD(
            inAsyncCall: _isInProgress,
            opacity: 0,
            progressIndicator: SizedBox(),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height,
                    minWidth: MediaQuery.of(context).size.width),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: height / 1.6, right: 16, left: 16, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AnimatedOpacity(
                        duration: Duration(milliseconds: 500),
                        opacity: _visible ? 1.0 : 0.0,
                        child: Text(
                          'Professional\ncryptocurrency\nexchange',
                          style: TextStyle(
                            color: AllCoustomTheme.getTextThemeColors(),
                            fontSize: 38,
                            letterSpacing: 0.8,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height / 40,
                      ),
                      _visible
                          ? AnimatedOpacity(
                              duration: Duration(milliseconds: 500),
                              opacity: _visibleButtons ? 1.0 : 0.0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                    child: FlatButton(
                                      padding: EdgeInsets.all(0),
                                      onPressed: () async {
                                        setState(() {
                                          _isInProgress = true;
                                        });
                                        await Future.delayed(
                                            const Duration(seconds: 1));

                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .push(
                                          CupertinoPageRoute<void>(
                                            builder: (BuildContext context) =>
                                                SignInScreen(),
                                          ),
                                        )
                                            .then((onValue) {
                                          setState(() {
                                            _isInProgress = false;
                                          });
                                        });
                                      },
                                      child: new Container(
                                        height: 45.0,
                                        alignment: FractionalOffset.center,
                                        decoration: BoxDecoration(
                                          border: new Border.all(
                                              color: Colors.white, width: 1.5),
                                          borderRadius:
                                              new BorderRadius.circular(30),
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
                                          "Sign in",
                                          style: new TextStyle(
                                            color: AllCoustomTheme
                                                .getReBlackAndWhiteThemeColors(),
                                            letterSpacing: 0.3,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(
                                    child: FlatButton(
                                      padding: EdgeInsets.all(0),
                                      child: new Container(
                                        height: 45.0,
                                        alignment: FractionalOffset.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              new BorderRadius.circular(30),
                                          color: AllCoustomTheme
                                              .getTextThemeColors(),
                                        ),
                                        child: GradientText(
                                          "Register",
                                          gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              globals.buttoncolor1,
                                              globals.buttoncolor2,
                                            ],
                                          ),
                                          style: new TextStyle(
                                            letterSpacing: 0.3,
                                          ),
                                        ),
                                      ),
                                      onPressed: () async {
                                        setState(() {
                                          _isInProgress = true;
                                        });
                                        await Future.delayed(
                                            const Duration(seconds: 1));
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .push(
                                          CupertinoPageRoute<void>(
                                            builder: (BuildContext context) =>
                                                SignUpScreen(),
                                          ),
                                        )
                                            .then((onValue) {
                                          setState(() {
                                            _isInProgress = false;
                                          });
                                        });
                                      },
                                    ),
                                  )
                                ],
                              ),
                            )
                          : SizedBox(),
                      SizedBox(
                        height: 10,
                      ),
                      _isInProgress
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                CupertinoActivityIndicator(
                                  radius: 12,
                                ),
                              ],
                            )
                          : SizedBox(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
